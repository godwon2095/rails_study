class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :destroy

  enum role: [:admin, :normal]
end
