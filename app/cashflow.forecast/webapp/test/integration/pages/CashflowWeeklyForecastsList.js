sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'hackathon.valuesphere.cashflow.forecast',
            componentId: 'CashflowWeeklyForecastsList',
            contextPath: '/CashflowWeeklyForecasts'
        },
        CustomPageDefinitions
    );
});