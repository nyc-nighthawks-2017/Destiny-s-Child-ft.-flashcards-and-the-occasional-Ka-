class Deck < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :cards
  has_many :rounds
end
