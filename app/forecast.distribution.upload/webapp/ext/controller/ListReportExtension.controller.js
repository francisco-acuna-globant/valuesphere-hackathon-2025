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
	"hackathon/valuesphere/forecast/distribution/upload/ext/utils/SpreadsheetHelper"
], function (ControllerExtension, JSONModel, Fragment, Messaging, Message, MessageToast, CoreLibrary, MessagePopover, MessageItem, SpreadsheetHelper) {
	'use strict';

	return ControllerExtension.extend('hackathon.valuesphere.forecast.distribution.upload.ext.controller.ListReportExtension', {
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

		// Mass upload logic
		onMassUpload: function () {
			Messaging.removeAllMessages()
			this._spreadsheetDialog = this.getView().byId("spreadsheetDialog")
			if (!this._spreadsheetDialog) {
				Fragment.load({
					id: this.oView.getId(),
					name: "hackathon.valuesphere.forecast.distribution.upload.ext.fragments.SpreadsheetUploadDialog",
					controller: this,
				}).then((oDialog) => {
					this._spreadsheetDialog = oDialog
					this.oView.addDependent(this._spreadsheetDialog)
					this._spreadsheetDialog.open()
				})
			} else {
				this._spreadsheetDialog.open()
			}
		},

		onSpreadsheetDialogClose: function () {
			this._spreadsheetDialog.close();
			this._spreadsheetDialog.destroy();
		}

	});
});
