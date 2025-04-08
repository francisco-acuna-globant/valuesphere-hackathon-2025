sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'hackathon.valuesphere.forecast.distribution.upload',
            componentId: 'ForecastDistributionPercentageConfigsList',
            contextPath: '/ForecastDistributionPercentageConfigs'
        },
        CustomPageDefinitions
    );
});