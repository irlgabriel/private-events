class AddReferencesToEventAttendings < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_attendings, :attendee
    add_reference :event_attendings, :attended_event
  end
end
