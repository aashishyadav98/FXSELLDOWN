@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view: MCA Run Administration'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #XL,
  dataClass: #TRANSACTIONAL
}
define view entity ZI_FXS_RUNADM 
as select from gle_runadm_id as RunAdministration
{
  key applk as Application,
  key cast( runid as gle_runadm_dte_runid preserving type ) as RunID,
  prccat as ProcessCategory,
  status as RunStatus,
  progdate as RunDate,
  runts  as RunDateTime
}
where applk  = 'MCA' and
      prccat = 'FXS' and
      status = '2'
