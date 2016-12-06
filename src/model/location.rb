require 'active_record'

class Location < ActiveRecord::Base
  self.table_name = 'location'
  has_many :locations, foreign_key: 'parent_location_fk', class_name: 'Location'
  belongs_to :metadata, foreign_key: 'metadata_fk', class_name: 'LocationMetadata', :dependent => :destroy
  belongs_to :parent_location, foreign_key: 'parent_location_fk', class_name: 'Location'

  def <=> (other)
    if parent_location.nil?
      return -1
    end

    if other.parent_location.nil?
      return 1
    end

    id - other.id
  end
end