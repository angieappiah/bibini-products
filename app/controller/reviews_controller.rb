class ReviewsController < ApplicationController

  get '/reviews' do
    
    erb :"/reviews/show_review"
  end

  get '/reviews:new' do
    @products = Product.new
    erb :"/reviews/new_review"
  end
end


   
  



  

   

   
