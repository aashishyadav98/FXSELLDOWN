@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'MCA FX Sweep - Excluded Profit centers'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_FXS_EXCL_PRCTR as select from gle_mca_t030h
{
  key rbukrs as CompanyCode,
  key prctr as ProfitCenter
}

where prccat  = 'FXS' and
      prctype = ''    and
      waers   = '';
