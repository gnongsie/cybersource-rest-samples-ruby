require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call DecisionProfileReject

public
class DecisionProfileReject
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::DecisionManagerApi.new(api_client, config)

    # Calling DecisionProfileReject Sample code
    client_reference_information = CyberSource::Riskv1decisionsClientReferenceInformation.new
    client_reference_information.code = "54323007"

    card_information = CyberSource::Riskv1decisionsPaymentInformationCard.new
    card_information.number = "4444444444444448"
    card_information.expiration_month = "12"
    card_information.expiration_year = "2020"

    payment_information = CyberSource::Riskv1decisionsPaymentInformation.new
    payment_information.card = card_information

    amount_details = CyberSource::Riskv1decisionsOrderInformationAmountDetails.new
    amount_details.currency = "USD"
    amount_details.total_amount = "144.14"

    bill_to = CyberSource::Riskv1decisionsOrderInformationBillTo.new
    bill_to.address1 = "96, powers street"
    bill_to.administrative_area = "NH"
    bill_to.country = "US"
    bill_to.locality = "Clearwater milford"
    bill_to.first_name = "James"
    bill_to.last_name = "Smith"
    bill_to.phone_number = "7606160717"
    bill_to.email = "test@visa.com"
    bill_to.postal_code = "03055"

    order_information = CyberSource::Riskv1decisionsOrderInformation.new
    order_information.amount_details = amount_details
    order_information.bill_to = bill_to

    profile_information = CyberSource::Riskv1decisionsRiskInformationProfile.new
    profile_information.name = "profile2"

    risk_information = CyberSource::Riskv1decisionsRiskInformation.new
    risk_information.profile = profile_information

    request = CyberSource::CreateDecisionManagerCaseRequest.new
    request.order_information = order_information
    request.payment_information = payment_information
    request.client_reference_information = client_reference_information
    request.risk_information = risk_information
    
    data, status_code, headers = api_instance.create_decision_manager_case(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    DecisionProfileReject.new.main
  end
end
