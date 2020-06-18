class ReviewsController < ApplicationController

  get '/reviews' do
    @user = current_user
    @products = Product.all
    erb :"/reviews/products"
  end

  get '/reviews:new' do
    @products = Product.new
    erb :"/reviews/new_review"
  end

  post '/reviews/' do
    @user = current_user
    @word = params[:views]
    @views = true
    erb :"reviews/show_review"
  end

  patch '/reviews' do
    @product = Product.find_by(id: params[:id])
    @product.update(title: params[:title], description: params[:description], price: params[:price], image: params[:image])
            
    if @product.errors.any?
      erb :"/reviews/edit_review"
    else
      erb :"reviews/show_review"
    end
  end
end


   
  



  

   

   
