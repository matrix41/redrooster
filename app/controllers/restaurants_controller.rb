class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
  	@reviews = Review.all
    @restaurants = Restaurant.all
    @restaurants.each do |thing|
      if ( thing.id == params[:id].to_i )
        @var_name = thing.name
      end
    end # DO-loop for @restaurants 

    reviews_subset = []
    temp_array = []
    @reviews.each do |intrepid|
      if ( intrepid.restaurant_id == params[:id].to_i )
        temp_array.push(intrepid)
      end
    end
    @reviews_subset = temp_array
    @restaurant_number = params[:id].to_i
  end # end of def show 

  def create
    restaurant = Restaurant.new(restaurant_params)
    if restaurant.save
      flash[:notice] = 'Yay'
#      redirect_to root_path
      redirect_to '/'
    else
      flash[:notice] = restaurant.errors.full_messages.to_sentence
      render :action => 'new'
    end
  end

private
  def restaurant_params
    params.permit(:name, :city, :cuisine, :expensive)
  end

end
