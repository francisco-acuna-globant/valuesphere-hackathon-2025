sap.ui.define([
	'sap/ui/core/mvc/ControllerExtension',
	"sap/ui/model/json/JSONModel",
	"sap/ui/core/Fragment",
	"sap/ui/core/Messaging",
	"sap/ui/core/message/Message",
	"sap/m/MessageToast",
	"sap/ui/core/library",
	"sap/m/MessagePopover",
	"sap/m/MessageItem"
], function (ControllerExtension, JSONModel, Fragment, Messaging, Message, MessageToast, CoreLibrary, MessagePopover, MessageItem) {
	'use strict';

	return ControllerExtension.extend('hackathon.valuesphere.forecast.distribution.ext.controller.ListReportExtension', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
			 * Called when a controller is instantiated and its View controls (if available) are already created.
			 * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
			 * @memberOf meli.fi.interco.regional.metrics.config.ext.controller.ListReportExtension
			 */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				this.oView = this.getView()
				this.oResourceBundle = this.base.getResourceBundle()
				this.oMessageModel = Messaging.getMessageModel()
				this.oView.setModel(this.oMessageModel, "message")
			}
		},

		onApprove: function () {
			this._updateItemsStatus('APPROVED');
		},

		onReject: function () {
			this._updateItemsStatus('REJECTED');
		},

        onMassUpload: function () {
			this._updateItemsStatus('NEW');
		},

		_updateItemsStatus: function(newStatus) {
			// Get the table reference from the view
			const TABLE_ID = 'hackathon.valuesphere.forecast.distribution::ForecastDistributionPercentageConfigsList--fe::table::ForecastDistributionPercentageConfigs::LineItem-innerTable';
			const oTable = sap.ui.getCore().byId(TABLE_ID);
			
			if (!oTable) {
				sap.m.MessageToast.show("Table not found");
				return;
			}
			
			// Get selected contexts using the selection plugin's method
			const aSelectedContexts = oTable.getSelectedContexts();
			
			if (!aSelectedContexts || aSelectedContexts.length === 0) {
				sap.m.MessageToast.show("No items selected");
				return;
			}
			
			// Show busy indicator
			sap.ui.core.BusyIndicator.show(0);
			
			// Get the OData v4 model
			const oModel = this.getView().getModel();
			
			// Create a batch group ID for these updates
			const sBatchGroupId = "statusUpdateBatch";
			
			// Set up batch processing if supported
			try {
				// For OData V4 models that support deferred groups
				if (typeof oModel.setDeferredGroups === "function") {
					oModel.setDeferredGroups([sBatchGroupId]);
				}
			} catch (e) {
				console.log("Deferred groups not supported, using standard updates");
			}
			
			// Create an array to track all update promises
			const aUpdatePromises = [];
			
			// Update each selected item
			aSelectedContexts.forEach(oContext => {
				try {
					// Try with batch group first
					const oPromise = oContext.setProperty("status", newStatus, sBatchGroupId);
					aUpdatePromises.push(oPromise);
				} catch (e) {
					// Fallback to standard update without batch
					const oPromise = oContext.setProperty("status", newStatus);
					aUpdatePromises.push(oPromise);
				}
			});
			
			// Submit changes - either as batch or wait for all individual updates
			let submitPromise;
			
			if (typeof oModel.submitBatch === "function") {
				submitPromise = oModel.submitBatch(sBatchGroupId);
			} else {
				submitPromise = Promise.all(aUpdatePromises);
			}
			
			// Handle the result
			submitPromise
				.then(() => {
					sap.ui.core.BusyIndicator.hide();
					sap.m.MessageToast.show(`${aSelectedContexts.length} items successfully ${newStatus.toLowerCase()}`);
				})
				.catch(oError => {
					sap.ui.core.BusyIndicator.hide();
					sap.m.MessageBox.error(`Error updating items: ${oError.message || "Unknown error"}`);
					console.error("Error updating items:", oError);
					
				});
		},

	});
});
