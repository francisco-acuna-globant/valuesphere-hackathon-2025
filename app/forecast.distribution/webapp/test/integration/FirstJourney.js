sap.ui.define([
    "sap/ui/test/opaQunit"
], function (opaTest) {
    "use strict";

    var Journey = {
        run: function() {
            QUnit.module("First journey");

            opaTest("Start application", function (Given, When, Then) {
                Given.iStartMyApp();

                Then.onTheForecastDistributionPercentageConfigsList.iSeeThisPage();

            });


            opaTest("Navigate to ObjectPage", function (Given, When, Then) {
                // Note: this test will fail if the ListReport page doesn't show any data
                
                When.onTheForecastDistributionPercentageConfigsList.onFilterBar().iExecuteSearch();
                
                Then.onTheForecastDistributionPercentageConfigsList.onTable().iCheckRows();

                When.onTheForecastDistributionPercentageConfigsList.onTable().iPressRow(0);
                Then.onTheForecastDistributionPercentageConfigsObjectPage.iSeeThisPage();

            });

            opaTest("Teardown", function (Given, When, Then) { 
                // Cleanup
                Given.iTearDownMyApp();
            });
        }
    }

    return Journey;
});