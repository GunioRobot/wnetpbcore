class Identifier < ActiveRecord::Base
  include PbcoreXmlElement
  belongs_to :asset
  belongs_to :identifier_source
  stampable

  xml_text_field :identifier
  xml_attributes({"source" => :identifier_source}, "ref", "annotation")

  validates_length_of :identifier, :minimum => 1
  validates_presence_of :identifier_source
  def validate
    super
    unless doing_xml? || identifier_source.nil? || identifier_source.regex.nil? ||
        Regexp.new(identifier_source.regex).match(identifier)
      self.errors.add("identifier", "does not match the rules for the selected identifier source")
    end
  end
end
