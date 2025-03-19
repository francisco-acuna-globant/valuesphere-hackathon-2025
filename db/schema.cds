namespace valuesphere;
using { cuid, managed } from '@sap/cds/common';

@assert.unique: { category: [category] }
entity ForecastDistributionPercentageConfigs : cuid, managed {
  category: String(100) @mandatory;
  companyCode: String(4) @mandatory;
  validityDate: String(10) @mandatory;
  percentage: Decimal(5,2);
}

@assert.unique: { sourceType: [sourceType] }
entity CashflowWeeklyForecasts : cuid, managed {
  sourceType: String(100) @mandatory;
  company: String(4) @mandatory;
  heads: String(100) @mandatory;
  subHeads: String(100) @mandatory;
  year: String(4) @mandatory;
  w01: Decimal(23,2);
  w02: Decimal(23,2);
  w03: Decimal(23,2);
  w04: Decimal(23,2);
  w05: Decimal(23,2);
  w06: Decimal(23,2);
  w07: Decimal(23,2);
  w08: Decimal(23,2);
  w09: Decimal(23,2);
  w10: Decimal(23,2);
  w11: Decimal(23,2);
  w12: Decimal(23,2);
  w13: Decimal(23,2);
  w14: Decimal(23,2);
  w15: Decimal(23,2);
  w16: Decimal(23,2);
  w17: Decimal(23,2);
  w18: Decimal(23,2);
  w19: Decimal(23,2);
  w20: Decimal(23,2);
  w21: Decimal(23,2);
  w22: Decimal(23,2);
  w23: Decimal(23,2);
  w24: Decimal(23,2);
  w25: Decimal(23,2);
  w26: Decimal(23,2);
  w27: Decimal(23,2);
  w28: Decimal(23,2);
  w29: Decimal(23,2);
  w30: Decimal(23,2);
  w31: Decimal(23,2);
  w32: Decimal(23,2);
  w33: Decimal(23,2);
  w34: Decimal(23,2);
  w35: Decimal(23,2);
  w36: Decimal(23,2);
  w37: Decimal(23,2);
  w38: Decimal(23,2);
  w39: Decimal(23,2);
  w40: Decimal(23,2);
  w41: Decimal(23,2);
  w42: Decimal(23,2);
  w43: Decimal(23,2);
  w44: Decimal(23,2);
  w45: Decimal(23,2);
  w46: Decimal(23,2);
  w47: Decimal(23,2);
  w48: Decimal(23,2);
  w49: Decimal(23,2);
  w50: Decimal(23,2);
  w51: Decimal(23,2);
  w52: Decimal(23,2);
  w53: Decimal(23,2);
}

