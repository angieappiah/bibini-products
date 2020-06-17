class ReviewsController < ApplicationController

    get '/reviews' do
      @user = current_user
      @products = Product.all
      @reviews = Review.all
      erb :"reviews/products"
    end
  
end