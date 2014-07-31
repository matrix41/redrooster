class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @my_average = avg
  end

  def new
    #leave blank
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

  def create
#    Review.create(review_params)
    the_review = Review.new(review_params)

    if the_review.save
      @message = "Review successfully saved!"
    else
      @message = "Review not saved :( Sorry"
#     @message = the_review.error.full_messages
    end
  end

private
  def review_params
    params.permit(:name, :title, :description, :star)
  end
end
