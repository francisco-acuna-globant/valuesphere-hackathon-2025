sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'hackathon.valuesphere.cashflow.forecast.upload',
            componentId: 'CashflowWeeklyForecastsList',
            contextPath: '/CashflowWeeklyForecasts'
        },
        CustomPageDefinitions
    );
});