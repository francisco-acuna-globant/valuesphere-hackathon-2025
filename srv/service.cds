using { valuesphere } from '../db/schema.cds';

@path: '/service/cashflowForecast'
@requires: 'authenticated-user'
service CashflowForecastService {
  @odata.draft.enabled
  @odata.draft.bypass
  entity ForecastDistributionPercentageConfigs as projection on valuesphere.ForecastDistributionPercentageConfigs;
  @odata.draft.enabled
  @odata.draft.bypass
  entity CashflowWeeklyForecasts as projection on valuesphere.CashflowWeeklyForecasts;
}