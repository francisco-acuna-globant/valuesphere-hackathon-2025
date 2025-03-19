sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cashflowforecastmain/test/integration/FirstJourney',
		'cashflowforecastmain/test/integration/pages/CashflowWeeklyForecastsList',
		'cashflowforecastmain/test/integration/pages/CashflowWeeklyForecastsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CashflowWeeklyForecastsList, CashflowWeeklyForecastsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cashflowforecastmain') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCashflowWeeklyForecastsList: CashflowWeeklyForecastsList,
					onTheCashflowWeeklyForecastsObjectPage: CashflowWeeklyForecastsObjectPage
                }
            },
            opaJourney.run
        );
    }
);