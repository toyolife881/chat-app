class RoomUser < ApplicationRecord
  belongs_to :room
  belogns_to :user
end
