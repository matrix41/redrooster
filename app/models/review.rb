class Review < ActiveRecord::Base
  validates_presence_of :name, :title, :description, :star
end
