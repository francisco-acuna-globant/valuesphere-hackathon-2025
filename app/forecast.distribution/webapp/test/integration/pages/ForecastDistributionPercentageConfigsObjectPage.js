sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'hackathon.valuesphere.forecast.distribution',
            componentId: 'ForecastDistributionPercentageConfigsObjectPage',
            contextPath: '/ForecastDistributionPercentageConfigs'
        },
        CustomPageDefinitions
    );
});