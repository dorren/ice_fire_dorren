class House < ApplicationRecord
  has_many :characters, through: :memberships
end
