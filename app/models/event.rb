class Event < ApplicationRecord

  belongs_to :creator, class_name: "User"
  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings

  scope :upcoming, -> { where("date >= #{Time.now.day}") }
  scope :past, -> { where("date < #{Time.now.day}") }
end