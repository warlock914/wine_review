class Logentry < ActiveRecord::Base
  belongs_to :wine
  STARS = 1..5
  validates :name, :rating, :location, :comments, :tasted_on, presence: true
  validates :comments, length: { minimum: 3 }, unless: 'comments.blank?'
  validates :rating, inclusion: { in: STARS, message: "must be from #{STARS.first} to #{STARS.last}" }
end
