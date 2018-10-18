class ProductsController < ApplicationController
  def index
    @products = Product.all.order(name: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new


  end 

  def create
    product = Product.create(name: params[:name],
                             description: params[:description],
                             price: params[:price],
                             image_url: params[:image_url]
                            )
    redirect_to "/products"
  end


  def edit
    id = params[:id]
    @product = Product.find(id)
  end


  def update
    product = Product.find(params[:id])
    product.update(name: params[:name],
                  description: params[:description],
                  price: params[:price],
                  image_url: params[:image_url]
                  )
    redirect_to "/products/#{product.id}"
  end

  def destroy
    Product.find(params[:id]).destroy

    redirect_to "/products"

  end
end
