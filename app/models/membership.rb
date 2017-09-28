class Membership < ApplicationRecord
  belongs_to :character
  belongs_to :house
end
