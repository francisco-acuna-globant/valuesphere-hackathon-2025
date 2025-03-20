sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'hackathon/valuesphere/forecast/distribution/test/integration/FirstJourney',
		'hackathon/valuesphere/forecast/distribution/test/integration/pages/ForecastDistributionPercentageConfigsList',
		'hackathon/valuesphere/forecast/distribution/test/integration/pages/ForecastDistributionPercentageConfigsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ForecastDistributionPercentageConfigsList, ForecastDistributionPercentageConfigsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('hackathon/valuesphere/forecast/distribution') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheForecastDistributionPercentageConfigsList: ForecastDistributionPercentageConfigsList,
					onTheForecastDistributionPercentageConfigsObjectPage: ForecastDistributionPercentageConfigsObjectPage
                }
            },
            opaJourney.run
        );
    }
);