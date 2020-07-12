class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :event_attending, class_name: "User"
end