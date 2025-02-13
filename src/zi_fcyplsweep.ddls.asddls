@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface view for MCA FX Sweep'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_FCYPLSWEEP
as select from  I_JournalEntryItem      as JournalEntryItem
  inner join ZI_FXS_DOCHDR       as fxsDocHeader     on  JournalEntryItem.AccountingDocument = fxsDocHeader.AccountingDocument
                                                         and JournalEntryItem.CompanyCode        = fxsDocHeader.CompanyCode
                                                         and JournalEntryItem.FiscalYear         = fxsDocHeader.FiscalYear
  
  inner join ZI_TRADEOUTACCOUNT as fxTradeOut       on  JournalEntryItem.GLAccount = fxTradeOut.GLAccount
                                                        

  association [0..*] to I_PCHNodeDetails as _ProfitCenterHierarchyDetails on  $projection.ControllingArea    = _ProfitCenterHierarchyDetails.ControllingArea
                                                                          and $projection.SourceProfitCenter = _ProfitCenterHierarchyDetails.ProfitCenter                                                         

{
  key JournalEntryItem.SourceLedger,
  key JournalEntryItem.CompanyCode,
  key JournalEntryItem.FiscalYear,
  key JournalEntryItem.AccountingDocument,
  key JournalEntryItem.LedgerGLLineItem,
  key JournalEntryItem.Ledger,
      JournalEntryItem.ControllingArea,
      JournalEntryItem.AccountingDocumentType,
      fxsDocHeader.BatchInputSession,
      fxsDocHeader.RunDate,
      fxsDocHeader.RunDateTime,
      JournalEntryItem.PostingDate,
      JournalEntryItem.GLAccount as TargetAccount,
      cast( JournalEntryItem.AssignmentReference as abap.char( 10 ) ) as SourceProfitCenter,
      JournalEntryItem.ProfitCenter as TargetProfitCenter,
      JournalEntryItem.TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      JournalEntryItem.AmountInTransactionCurrency as AmountInTransactionCurrency,
      JournalEntryItem.CompanyCodeCurrency,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      JournalEntryItem.AmountInCompanyCodeCurrency as AmountInCompanyCodeCurrency,
      JournalEntryItem.GlobalCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      JournalEntryItem.AmountInGlobalCurrency as AmountInGlobalCurrency,
      JournalEntryItem.OffsettingAccount,
      cast( JournalEntryItem.AssignmentReference as abap.char( 10 ) ) as OffsetProfitCenter,
      _ProfitCenterHierarchyDetails
}
where
      JournalEntryItem.TransactionCurrency <> JournalEntryItem.CompanyCodeCurrency
  and JournalEntryItem.SourceLedger        =  JournalEntryItem.Ledger
