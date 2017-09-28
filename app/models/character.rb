class Character < ApplicationRecord
  has_many :houses, through: :memberships
end
