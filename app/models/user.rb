class User < ApplicationRecord
  validates :email, :username, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_many :rounds
  has_many :decks
  has_many :decks_played, through: :rounds, source: :deck

  has_secure_password
end
