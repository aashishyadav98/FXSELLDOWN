@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view: FX Sweep Docs'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_FXS_DOCHDR as select from I_JournalEntry as fxSweepDocs
inner join ZI_FXS_RUNADM as fxsRunAdm on fxSweepDocs.BatchInputSession = fxsRunAdm.RunID
{
  key fxSweepDocs.CompanyCode,
  key fxSweepDocs.FiscalYear,
  key fxSweepDocs.AccountingDocument,
      fxSweepDocs.BatchInputSession,
      fxsRunAdm.RunDate,
      fxsRunAdm.RunDateTime
}
