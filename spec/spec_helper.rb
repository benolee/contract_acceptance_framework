require 'active_record'
require 'contract_acceptance_framework'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Base.connection.create_table(:contracts) do |t|
  t.string  :key
  t.text    :content
  t.integer :major_version
  t.integer :minor_version
  t.integer :maintenance_version
  t.timestamps
end

ActiveRecord::Base.connection.create_table(:contract_acceptances) do |t|
  t.integer :contract_id
  t.integer :acceptable_id
  t.string  :acceptable_type
end

ActiveRecord::Base.connection.create_table(:people)

class Person < ActiveRecord::Base
  include ContractAcceptanceFramework
end

