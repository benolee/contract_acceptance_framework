require 'spec_helper'

describe 'Contract Acceptance Framework' do
  let(:person) { Person.create }
  let(:contract) do
    Contract.create(:major_version => 0, :minor_version => 0,
                    :maintenance_version => 0, :key => 'unique string',
                    :content => 'content')
  end

  describe '.agree_to!' do
    it 'should agree to the contract' do
      person.agree_to!(contract)
      person.contracts.include?(contract).should be_true
    end

    context 'when the contract has been previously agreed to' do
      before { person.agree_to!(contract) }

      it 'should raise a contract duplicate agreement error' do
        lambda { person.agree_to!(contract) }.should raise_error ContractDuplicateAgreementError
      end
    end
  end

  describe '.has_agreed_to?' do
    subject { person.has_agreed_to?(contract) }

    context 'when the contract has been agreed to' do
      before { person.agree_to!(contract) }
      it { should be_true }
    end

    context 'when the contract has not been agreed to' do
      it { should be_false }
    end
  end
end

