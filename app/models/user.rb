class User < ApplicationRecord
  has_many :posts
  before_save {self.email = email.downcase}
  validates :name, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum:20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false},
                    length: {minimum: 10, maximum: 255}
end
