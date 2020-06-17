class ProductsController < ApplicationController

    get '/products' do
      @user = current_user
      @products = Product.all
      erb :"shop/products"
    end

      
    get '/products/new' do
      @product = Product.new
      erb :"/shop/new_product"
    end

       
    post '/products' do
      @product = Product.create(title: params[:title], description: params[:description], price: params[:price], user: current_user, image: params[:image])
        
      if @product.errors.any?
        erb :"/shop/new_product"
      else
        erb :"shop/show_products"
      end
    end

    #localhost:9393/products/newest
    get '/products/newest' do
      @product = Product.last
      erb :"shop/show_products"
    end
  
       
    get '/products/:id' do  
      @product = Product.find_by_id(params[:id])
      erb :"shop/show_products"
    end
    
    get '/products/:id/edit' do
        @product = Product.find_by(id: params[:id])
    
        if logged_in? && @product.user_id == current_user.id
          erb :"shop/edit_product"
        else
          @failed = true
          erb :"shop/show_products"
        end
    end
  
    patch '/products/:id' do
      @product = Product.find_by(id: params[:id])
      @product.update(title: params[:title], description: params[:description], price: params[:price], image: params[:image])
              
      if @product.errors.any?
        erb :"/shop/edit_product"
      else
        erb :"shop/show_products"
      end
    end
  
    delete '/products/:id' do
      product = Product.find_by_id(params[:id])
      product.delete if product.user_id == current_user.id
      
      redirect '/products'
    end
  
    post '/products/search' do
      @user = current_user
      @word = params[:search]
      @search = true
      erb :"shop/products"
    end
  
end

#write a route that a use can visit called /products/newest which shows the user the most recently added product in the database
