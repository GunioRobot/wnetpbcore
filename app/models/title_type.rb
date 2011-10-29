class TitleType < ActiveRecord::Base
  include Picklist
  belongs_to :category, :class_name => 'TitleTypeCategory'
  has_many :titles
  quick_column :name

  def safe_to_delete?
    titles.size == 0
  end
end
