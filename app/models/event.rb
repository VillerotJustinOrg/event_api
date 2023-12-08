class Event < ApplicationRecord
    has_many :est_present
    has_many :person, :through => :est_present

    belongs_to :event_type
end
