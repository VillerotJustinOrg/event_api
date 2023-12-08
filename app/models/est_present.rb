class EstPresent < ApplicationRecord
    belongs_to :event
    has_one :person
end
