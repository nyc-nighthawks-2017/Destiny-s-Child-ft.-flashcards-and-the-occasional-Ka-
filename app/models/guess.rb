class Guess < ApplicationRecord
  validates :answer, :user_guess, presence: true

  belongs_to :round
  belongs_to :card
end
