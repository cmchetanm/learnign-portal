class Question < ApplicationRecord
  belongs_to :chapter
  has_many :options
  has_one :answer
  has_many :user_answers

  enum level: [:easy, :medium, :hard]
end
