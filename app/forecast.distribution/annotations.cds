using {CashflowForecastService} from '../../srv/service';

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.HeaderInfo: {
  TypeName      : 'Forecast Distribution Percentage Config',
  TypeNamePlural: 'Forecast Distribution Percentage Configs',
  Title         : {Value: category}
};

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with {
  ID  @UI.Hidden  @Common.Text: {
    $value                : category,
    ![@UI.TextArrangement]: #TextOnly
  }
};

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.Identification: [{Value: category}];

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with {
  status       @title: 'Status';
  category     @title: 'Category';
  companyCode  @title: 'Company Code';
  validityDate @title: 'Validity Date';
  percentage   @title: 'Percentage';
  createdAt    @title: 'Created At';
  createdBy    @title: 'Created By';
  modifiedAt   @title: 'Modified At';
  modifiedBy   @title: 'Modified By'
};

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.LineItem: [
  {
    $Type                    : 'UI.DataField',
    Value                    : status,
    Criticality              : {$edmJson: {$If: [
      {$Eq: [
        {$Path: 'status'},
        'NEW'
      ]},
      4, // Information (blue)
      {$If: [
        {$Eq: [
          {$Path: 'status'},
          'APPROVED'
        ]},
        3, // Positive (green)
        {$If: [
          {$Eq: [
            {$Path: 'status'},
            'REJECTED'
          ]},
          1, // Negative (red)
          0 // Neutral (default)
        ]}
      ]}
    ]}},
    CriticalityRepresentation: #WithoutIcon
  },
  {
    $Type: 'UI.DataField',
    Value: category
  },
  {
    $Type: 'UI.DataField',
    Value: companyCode
  },
  {
    $Type: 'UI.DataField',
    Value: validityDate
  },
  {
    $Type: 'UI.DataField',
    Value: percentage
  }
];

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType',
  Data : [
    {
      $Type                    : 'UI.DataField',
      Value                    : status,
      Criticality              : {$edmJson: {$If: [
        {$Eq: [
          {$Path: 'status'},
          'NEW'
        ]},
        4, // Information (blue) - you had 0 here
        {$If: [
          {$Eq: [
            {$Path: 'status'},
            'APPROVED'
          ]},
          3, // Positive (green)
          {$If: [
            {$Eq: [
              {$Path: 'status'},
              'REJECTED'
            ]},
            1, // Negative (red)
            0 // Neutral (default)
          ]}
        ]}
      ]}},
      CriticalityRepresentation: #WithoutIcon
    },
    {
      $Type: 'UI.DataField',
      Value: category
    },
    {
      $Type: 'UI.DataField',
      Value: companyCode
    },
    {
      $Type: 'UI.DataField',
      Value: validityDate
    },
    {
      $Type: 'UI.DataField',
      Value: percentage
    },
    {
      $Type: 'UI.DataField',
      Value: createdAt
    },
    {
      $Type: 'UI.DataField',
      Value: createdBy
    },
    {
      $Type: 'UI.DataField',
      Value: modifiedAt
    },
    {
      $Type: 'UI.DataField',
      Value: modifiedBy
    }
  ]
};

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.Facets: [{
  $Type : 'UI.ReferenceFacet',
  ID    : 'Main',
  Label : 'General Information',
  Target: '@UI.FieldGroup#Main'
}];

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with @UI.SelectionFields: [category];

annotate CashflowForecastService.ForecastDistributionPercentageConfigs with {
  status @(CommonText: {
    TextArrangement         : #TextOnly,
    ValueListWithFixedValues: true
  })
};
