class InstantiationDateType < ActiveRecord::Base
  include Picklist
  has_many :instantiation_dates
  quick_column :name

  def safe_to_delete?
    instantiation_dates.size == 0
  end

  def self.xml_picklist_name
    "InstantiationDateType"
  end
end
