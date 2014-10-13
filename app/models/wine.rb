class Wine < ActiveRecord::Base
	def average_ratings
      logentries.average(:rating)
    end
	has_many :logentries, dependent: :destroy
	validates :name, :year, :country, presence: true
validates :year,
   numericality: { only_integer: true, greater_than_or_equal_to: 0 },
   unless: "year.blank?"
   	validates :varietal, inclusion: { in: %w(MERLOT CHIANTI CABERNET),
    message: "%{value} is not a valid type, must be MERLOT CHIANTI CABERNET" }
end
