using { valuesphere } from '../db/schema.cds';

@path: '/service/cashflowForecast'
@requires: 'authenticated-user'
service CashflowForecastService {
  @odata.draft.enabled
  entity ForecastDistributionPercentageConfigs as projection on valuesphere.ForecastDistributionPercentageConfigs;
  @odata.draft.enabled
  entity CashflowWeeklyForecasts as projection on valuesphere.CashflowWeeklyForecasts;
}