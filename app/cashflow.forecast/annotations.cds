using { CashflowForecastService } from '../../srv/service';

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.HeaderInfo: { TypeName: 'Forecast Distribution Percentage Config', TypeNamePlural: 'Forecast Distribution Percentage Configs', Title: { Value: category } };
annotate CashflowForecastService.ForecastDistributionPercentageConfigs with {
  ID @UI.Hidden @Common.Text: { $value: category, ![@UI.TextArrangement]: #TextOnly }
};
annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.Identification: [{ Value: category }];
annotate CashflowForecastService.ForecastDistributionPercentageConfigs with {
  category @title: 'Category';
  companyCode @title: 'Company Code';
  validityDate @title: 'Validity Date';
  percentage @title: 'Percentage';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: category },
 { $Type: 'UI.DataField', Value: companyCode },
 { $Type: 'UI.DataField', Value: validityDate },
 { $Type: 'UI.DataField', Value: percentage }
];

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: category },
 { $Type: 'UI.DataField', Value: companyCode },
 { $Type: 'UI.DataField', Value: validityDate },
 { $Type: 'UI.DataField', Value: percentage },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy }
  ]
};

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.SelectionFields: [
  category
];

annotate CashflowForecastService.CashflowWeeklyForecasts with @UI.HeaderInfo: { TypeName: 'Cashflow Weekly Forecast', TypeNamePlural: 'Cashflow Weekly Forecasts', Title: { Value: sourceType } };
annotate CashflowForecastService.CashflowWeeklyForecasts with {
  ID @UI.Hidden @Common.Text: { $value: sourceType, ![@UI.TextArrangement]: #TextOnly }
};
annotate CashflowForecastService.CashflowWeeklyForecasts with @UI.Identification: [{ Value: sourceType }];
annotate CashflowForecastService.CashflowWeeklyForecasts with {
  status @title: 'Status';
  sourceType @title: 'Source Type';
  company @title: 'Company';
  heads @title: 'Heads';
  subHeads @title: 'Sub Heads';
  year @title: 'Year';
  w01 @title: 'Week 01';
  w02 @title: 'Week 02';
  w03 @title: 'Week 03';
  w04 @title: 'Week 04';
  w05 @title: 'Week 05';
  w06 @title: 'Week 06';
  w07 @title: 'Week 07';
  w08 @title: 'Week 08';
  w09 @title: 'Week 09';
  w10 @title: 'Week 10';
  w11 @title: 'Week 11';
  w12 @title: 'Week 12';
  w13 @title: 'Week 13';
  w14 @title: 'Week 14';
  w15 @title: 'Week 15';
  w16 @title: 'Week 16';
  w17 @title: 'Week 17';
  w18 @title: 'Week 18';
  w19 @title: 'Week 19';
  w20 @title: 'Week 20';
  w21 @title: 'Week 21';
  w22 @title: 'Week 22';
  w23 @title: 'Week 23';
  w24 @title: 'Week 24';
  w25 @title: 'Week 25';
  w26 @title: 'Week 26';
  w27 @title: 'Week 27';
  w28 @title: 'Week 28';
  w29 @title: 'Week 29';
  w30 @title: 'Week 30';
  w31 @title: 'Week 31';
  w32 @title: 'Week 32';
  w33 @title: 'Week 33';
  w34 @title: 'Week 34';
  w35 @title: 'Week 35';
  w36 @title: 'Week 36';
  w37 @title: 'Week 37';
  w38 @title: 'Week 38';
  w39 @title: 'Week 39';
  w40 @title: 'Week 40';
  w41 @title: 'Week 41';
  w42 @title: 'Week 42';
  w43 @title: 'Week 43';
  w44 @title: 'Week 44';
  w45 @title: 'Week 45';
  w46 @title: 'Week 46';
  w47 @title: 'Week 47';
  w48 @title: 'Week 48';
  w49 @title: 'Week 49';
  w50 @title: 'Week 50';
  w51 @title: 'Week 51';
  w52 @title: 'Week 52';
  w53 @title: 'Week 53';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate CashflowForecastService.CashflowWeeklyForecasts with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: status },
 { $Type: 'UI.DataField', Value: sourceType },
 { $Type: 'UI.DataField', Value: company },
 { $Type: 'UI.DataField', Value: heads },
 { $Type: 'UI.DataField', Value: subHeads },
 { $Type: 'UI.DataField', Value: year },
 { $Type: 'UI.DataField', Value: w01 },
 { $Type: 'UI.DataField', Value: w02 },
 { $Type: 'UI.DataField', Value: w03 },
 { $Type: 'UI.DataField', Value: w04 },
 { $Type: 'UI.DataField', Value: w05 },
 { $Type: 'UI.DataField', Value: w06 },
 { $Type: 'UI.DataField', Value: w07 },
 { $Type: 'UI.DataField', Value: w08 },
 { $Type: 'UI.DataField', Value: w09 },
 { $Type: 'UI.DataField', Value: w10 },
 { $Type: 'UI.DataField', Value: w11 },
 { $Type: 'UI.DataField', Value: w12 },
 { $Type: 'UI.DataField', Value: w13 },
 { $Type: 'UI.DataField', Value: w14 },
 { $Type: 'UI.DataField', Value: w15 },
 { $Type: 'UI.DataField', Value: w16 },
 { $Type: 'UI.DataField', Value: w17 },
 { $Type: 'UI.DataField', Value: w18 },
 { $Type: 'UI.DataField', Value: w19 },
 { $Type: 'UI.DataField', Value: w20 },
 { $Type: 'UI.DataField', Value: w21 },
 { $Type: 'UI.DataField', Value: w22 },
 { $Type: 'UI.DataField', Value: w23 },
 { $Type: 'UI.DataField', Value: w24 },
 { $Type: 'UI.DataField', Value: w25 },
 { $Type: 'UI.DataField', Value: w26 },
 { $Type: 'UI.DataField', Value: w27 },
 { $Type: 'UI.DataField', Value: w28 },
 { $Type: 'UI.DataField', Value: w29 },
 { $Type: 'UI.DataField', Value: w30 },
 { $Type: 'UI.DataField', Value: w31 },
 { $Type: 'UI.DataField', Value: w32 },
 { $Type: 'UI.DataField', Value: w33 },
 { $Type: 'UI.DataField', Value: w34 },
 { $Type: 'UI.DataField', Value: w35 },
 { $Type: 'UI.DataField', Value: w36 },
 { $Type: 'UI.DataField', Value: w37 },
 { $Type: 'UI.DataField', Value: w38 },
 { $Type: 'UI.DataField', Value: w39 },
 { $Type: 'UI.DataField', Value: w40 },
 { $Type: 'UI.DataField', Value: w41 },
 { $Type: 'UI.DataField', Value: w42 },
 { $Type: 'UI.DataField', Value: w43 },
 { $Type: 'UI.DataField', Value: w44 },
 { $Type: 'UI.DataField', Value: w45 },
 { $Type: 'UI.DataField', Value: w46 },
 { $Type: 'UI.DataField', Value: w47 },
 { $Type: 'UI.DataField', Value: w48 },
 { $Type: 'UI.DataField', Value: w49 },
 { $Type: 'UI.DataField', Value: w50 },
 { $Type: 'UI.DataField', Value: w51 },
 { $Type: 'UI.DataField', Value: w52 },
 { $Type: 'UI.DataField', Value: w53 }
];

annotate CashflowForecastService.CashflowWeeklyForecasts with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: status },
 { $Type: 'UI.DataField', Value: sourceType },
 { $Type: 'UI.DataField', Value: company },
 { $Type: 'UI.DataField', Value: heads },
 { $Type: 'UI.DataField', Value: subHeads },
 { $Type: 'UI.DataField', Value: year },
 { $Type: 'UI.DataField', Value: w01 },
 { $Type: 'UI.DataField', Value: w02 },
 { $Type: 'UI.DataField', Value: w03 },
 { $Type: 'UI.DataField', Value: w04 },
 { $Type: 'UI.DataField', Value: w05 },
 { $Type: 'UI.DataField', Value: w06 },
 { $Type: 'UI.DataField', Value: w07 },
 { $Type: 'UI.DataField', Value: w08 },
 { $Type: 'UI.DataField', Value: w09 },
 { $Type: 'UI.DataField', Value: w10 },
 { $Type: 'UI.DataField', Value: w11 },
 { $Type: 'UI.DataField', Value: w12 },
 { $Type: 'UI.DataField', Value: w13 },
 { $Type: 'UI.DataField', Value: w14 },
 { $Type: 'UI.DataField', Value: w15 },
 { $Type: 'UI.DataField', Value: w16 },
 { $Type: 'UI.DataField', Value: w17 },
 { $Type: 'UI.DataField', Value: w18 },
 { $Type: 'UI.DataField', Value: w19 },
 { $Type: 'UI.DataField', Value: w20 },
 { $Type: 'UI.DataField', Value: w21 },
 { $Type: 'UI.DataField', Value: w22 },
 { $Type: 'UI.DataField', Value: w23 },
 { $Type: 'UI.DataField', Value: w24 },
 { $Type: 'UI.DataField', Value: w25 },
 { $Type: 'UI.DataField', Value: w26 },
 { $Type: 'UI.DataField', Value: w27 },
 { $Type: 'UI.DataField', Value: w28 },
 { $Type: 'UI.DataField', Value: w29 },
 { $Type: 'UI.DataField', Value: w30 },
 { $Type: 'UI.DataField', Value: w31 },
 { $Type: 'UI.DataField', Value: w32 },
 { $Type: 'UI.DataField', Value: w33 },
 { $Type: 'UI.DataField', Value: w34 },
 { $Type: 'UI.DataField', Value: w35 },
 { $Type: 'UI.DataField', Value: w36 },
 { $Type: 'UI.DataField', Value: w37 },
 { $Type: 'UI.DataField', Value: w38 },
 { $Type: 'UI.DataField', Value: w39 },
 { $Type: 'UI.DataField', Value: w40 },
 { $Type: 'UI.DataField', Value: w41 },
 { $Type: 'UI.DataField', Value: w42 },
 { $Type: 'UI.DataField', Value: w43 },
 { $Type: 'UI.DataField', Value: w44 },
 { $Type: 'UI.DataField', Value: w45 },
 { $Type: 'UI.DataField', Value: w46 },
 { $Type: 'UI.DataField', Value: w47 },
 { $Type: 'UI.DataField', Value: w48 },
 { $Type: 'UI.DataField', Value: w49 },
 { $Type: 'UI.DataField', Value: w50 },
 { $Type: 'UI.DataField', Value: w51 },
 { $Type: 'UI.DataField', Value: w52 },
 { $Type: 'UI.DataField', Value: w53 },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy }
  ]
};

annotate CashflowForecastService.CashflowWeeklyForecasts with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate CashflowForecastService.CashflowWeeklyForecasts with @UI.SelectionFields: [
  sourceType
];