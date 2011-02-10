class ContractAcceptance < ActiveRecord::Base
  belongs_to :acceptable, :polymorphic => true
  belongs_to :contract

  validates_presence_of :acceptable_id
  validates_presence_of :acceptable_type
  validates_presence_of :contract_id
end
