class Restaurant < ActiveRecord::Base
  has_many :reviews
  validates_presence_of :name, :city, :cuisine, :expensive
end
