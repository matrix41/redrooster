class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates_presence_of :name, :title, :description, :star
#  validates :star, presence: true, message:"Star count " # i do not think this line works
  validates_numericality_of :star # it means star has to be a number
  validates :star, inclusion: {in: 0..5, message: 'Star count must be between 0 and 5'}
end
