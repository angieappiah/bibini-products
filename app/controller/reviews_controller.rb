class ReviewsController < ApplicationController

    get '/reviews' do
      @user = current_user
      @products = Product.all
      @reviews = Review.all
      erb :"reviews/products"
    end

    get '/reviews/:id' do  
      @product = Product.find_by_id(params[:id])
      erb :"reviews/show_product"
    end

    get '/reviews/:id/edit' do
      @product = Product.find_by(id: params[:id])
  
      if logged_in? && @product.user_id == current_user.id
        erb :"reviews/edit_product"
      else
        @failed = true
        erb :"reviews/show_product"
      end
  end

   

   
end