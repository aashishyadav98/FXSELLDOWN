@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'MCA FX Sweep - Excluded Profit centers'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #XXL, dataClass: #TRANSACTIONAL }

@Metadata.allowExtensions: true
define view entity ZC_FXS_EXCL_PRCTR as select from ZI_MCA_FXS_VPC
{
  key CompanyCode,
  key ProfitCenter
}
