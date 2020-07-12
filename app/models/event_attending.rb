class EventAttending < ApplicationRecord
  belongs_to :event_author, class_name: "User"
  belongs_to :attented_event, class_name: "Event"
  
end
