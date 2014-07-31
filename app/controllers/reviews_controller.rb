class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    #leave blank
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
# Strong parameters 
# SQL injection problem: make: 'Accord' model: 'drop all tables'
# hackers injecting code into SQL via SQL queries
# Take params hash: i will only accept the following keys 
# Prevents unwanted keys
# Prevents unwanted SQL injection
    params.permit(:name, :title, :description, :star)
  end
end
