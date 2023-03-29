# frozen_string_literal: true

require 'date'
require 'schema_dot_org'
require 'schema_dot_org/person'
require 'schema_dot_org/place'


module SchemaDotOrg
  class Event < SchemaType
    attr_accessor :name,
                  :description,
                  :startDate,
                  :endDate,
                  :image,
                  :location,
                  :url

    validates :name,           type: String
    validates :description,    type: String
    validates :startDate,      type: Date
    validates :endDate,        type: Date
    validates :image,          type: String
    validates :location,       type: SchemaDotOrg::Place
    validates :url,            type: String

    def _to_json_struct
      {
        "name" => name,
        "description" => description,
        "startDate" => startDate,
        "endDate" => endDate,
        "location" => location.to_json_struct,
        "image" => image,
        "url" => url,
      }
    end
  end
end
