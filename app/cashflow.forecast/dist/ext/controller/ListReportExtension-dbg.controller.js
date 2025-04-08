sap.ui.define([
	'sap/ui/core/mvc/ControllerExtension',
	"sap/ui/model/json/JSONModel",
	"sap/ui/core/Fragment",
	"sap/ui/core/Messaging",
	"sap/ui/core/message/Message",
	"sap/m/MessageToast",
	"sap/ui/core/library",
	"sap/m/MessagePopover",
	"sap/m/MessageItem",
	"hackathon/valuesphere/cashflow/forecast/ext/utils/SpreadsheetHelper"
], function (ControllerExtension, JSONModel, Fragment, Messaging, Message, MessageToast, CoreLibrary, MessagePopover, MessageItem, SpreadsheetHelper) {
	'use strict';

	return ControllerExtension.extend('hackathon.valuesphere.cashflow.forecast.ext.controller.ListReportExtension', {
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
				SpreadsheetHelper.init(this.oResourceBundle)
			}
		},

		onTableSelectionChange: function (oEvent) {
			// Get the table
			const oTable = oEvent.getSource();
			const aSelectedContexts = oTable.getSelectedContexts();
			console.log("Selection changed. Selected rows:", aSelectedIndices.length);

			// Example: Show message with selection count
			if (aSelectedIndices.length > 0) {
				MessageToast.show(aSelectedIndices.length + " items selected");
			}
		},

		onApprove: function () {
			this._updateItemsStatus('APPROVED');
		},

		onReject: function () {
			this._updateItemsStatus('REJECTED');
		},

		_updateItemsStatus: function(newStatus) {
			// Get the table reference from the view
			const TABLE_ID = 'hackathon.valuesphere.cashflow.forecast::CashflowWeeklyForecastsList--fe::table::CashflowWeeklyForecasts::LineItem-innerTable';
			const oTable = sap.ui.getCore().byId(TABLE_ID);
			
			if (!oTable) {
				sap.m.MessageToast.show("Table not found");
				return;
			}
			
			// Get selected contexts using the selection plugin's method
			const aSelectedContexts = oTable._getSelectionPlugin().getSelectedContexts();
			
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
					
					// Refresh the list to show updated data
					oTable.getBinding("rows").refresh();
				})
				.catch(oError => {
					sap.ui.core.BusyIndicator.hide();
					sap.m.MessageBox.error(`Error updating items: ${oError.message || "Unknown error"}`);
					console.error("Error updating items:", oError);
					
					// Refresh to ensure UI is in sync with backend
					oTable.getBinding("rows").refresh();
				});
		},

		// Mass upload logic
		onMassUpload: function () {
			this._updateItemsStatus('NEW');
/* 			Messaging.removeAllMessages()
			this._spreadsheetDialog = this.getView().byId("spreadsheetDialog")
			if (!this._spreadsheetDialog) {
				Fragment.load({
					id: this.oView.getId(),
					name: "hackathon.valuesphere.cashflow.forecast.ext.fragments.SpreadsheetUploadDialog",
					controller: this,
				}).then((oDialog) => {
					this._spreadsheetDialog = oDialog
					this.oView.addDependent(this._spreadsheetDialog)
					this._spreadsheetDialog.open()
				})
			} else {
				this._spreadsheetDialog.open()
			} */
		},

		onSpreadsheetDialogClose: function () {
			this._spreadsheetDialog.close();
			this._spreadsheetDialog.destroy();
		}

	});
});
