class AddNameCityCuisineAndExpensive < ActiveRecord::Migration
  def change
  	add_column :restaurants, :city, :string
  	add_column :restaurants, :cuisine, :string
  	add_column :restaurants, :name, :string
  	add_column :restaurants, :expensive, :boolean
  end
end
