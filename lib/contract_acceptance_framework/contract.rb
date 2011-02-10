class Contract < ActiveRecord::Base
  has_many :contract_acceptances

  validates :maintenance_version, :uniqueness => { :scope => [:minor_version, :major_version, :key] }
  validates :maintenance_version, :minor_version, :major_version, :key, :content, :presence => true

  def version=(version_string) # Expects "1.0.2"
    versions = version_string.split(".")
    raise "invalid version_string" unless versions.size == 3
    self.major_version, self.minor_version, self.maintenance_version = versions
  end
end
