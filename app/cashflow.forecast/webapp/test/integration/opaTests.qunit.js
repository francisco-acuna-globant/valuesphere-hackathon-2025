sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'hackathon/valuesphere/cashflow/forecast/test/integration/FirstJourney',
		'hackathon/valuesphere/cashflow/forecast/test/integration/pages/CashflowWeeklyForecastsList',
		'hackathon/valuesphere/cashflow/forecast/test/integration/pages/CashflowWeeklyForecastsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CashflowWeeklyForecastsList, CashflowWeeklyForecastsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('hackathon/valuesphere/cashflow/forecast') + '/index.html'
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