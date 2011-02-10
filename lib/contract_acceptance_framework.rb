require 'contract_acceptance_framework/contract'
require 'contract_acceptance_framework/contract_acceptance'

module ContractAcceptanceFramework
  extend ActiveSupport::Concern

  included do
    raise "class must inherit from ActiveRecord::Base" unless self < ActiveRecord::Base

    has_many :contract_acceptances, :as => :acceptable
    has_many :contracts, :through => :contract_acceptances

    def has_agreed_to?(contract)
      contracts.include?(contract)
    end

    def agree_to!(contract)
      raise ContractDuplicateAgreementError if has_agreed_to?(contract)
      contract_acceptances.create(:contract => contract)
    end
  end
end

class ContractDuplicateAgreementError < StandardError; end
