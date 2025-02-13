@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #CHECK

@EndUserText.label: 'Consumption View for MCA FX Sweep'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #XXL, dataClass: #TRANSACTIONAL }

@Metadata.allowExtensions: true

define view entity ZC_FCYPLSWEEP
  as select from ZI_FCYPLSWEEP

{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,

      ControllingArea,
      AccountingDocumentType,
      BatchInputSession,
      RunDate,
      RunDateTime,
      PostingDate,
      @ObjectModel.text.element: ['HierarchyNodeText']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.filter.hidden: true
      @EndUserText.label: 'Desk Description'
      _ProfitCenterHierarchyDetails.ParentNode        as HierarchyNode,

      @Semantics.text: true
      @UI.hidden: true
      _ProfitCenterHierarchyDetails.HierarchyNodeText as HierarchyNodeText,

      SourceProfitCenter,
      TransactionCurrency,

      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      AmountInTransactionCurrency,

      CompanyCodeCurrency,

      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,

      GlobalCurrency,

      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      AmountInGlobalCurrency,

      TargetAccount,
      TargetProfitCenter,
      OffsettingAccount,
      OffsetProfitCenter,

      /* Associations */
      _ProfitCenterHierarchyDetails
}
