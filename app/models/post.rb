class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 20, maximum:100}
  validates :body, presence: true, length: {minimum:30, maximum:1000}
end
