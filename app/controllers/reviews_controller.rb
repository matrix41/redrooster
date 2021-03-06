class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @my_average = avg
  end

  def new
    @the_restaurant_id = params[:id]
  end

# avg action will calculate the average of all the star ratings
  def avg
    array = []
# this DO-loop will put all the star ratings into an array
    @reviews.each do |count|
       array.push(count.star.to_i)
    end
# this line will calculate the actual average of all the star ratings
    outavg = array.inject(0.0) { |sum, el| sum + el } / array.size
  end

  # def create
  #   the_review = Review.new(review_params)

  #   if the_review.save
  #     @message = "Review successfully saved!"
  #   else
  #     @message = "Review not saved :( Sorry"
  #   end
  # end

  def create
    review = Review.new(review_params)
    if review.save
      flash[:notice] = 'Yay'
#      redirect_to root_path
      redirect_to '/'
    else
      flash[:notice] = review.errors.full_messages.to_sentence
      render :action => 'new'
    end
  end

private
  def review_params
    params.permit(:name, :title, :description, :star, :restaurant_id)
  end
end
