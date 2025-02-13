@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for MCA Position accounts'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_TRADEOUTACCOUNT as select distinct from gle_mca_t030h
{
  key ktopl  as ChartOfAccount,
  key prccat as ProcessCategory,
  hkont1     as GLAccount
}
where prccat = 'TOP'
