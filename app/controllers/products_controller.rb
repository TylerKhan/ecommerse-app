class ProductsController < ApplicationController
    def index
    if params[:category] && params[:category].length > 2
      @category_name = params[:category]
      @category = Category.where('name iLIKE ?', "%#{@category_name}%")[0]

      if @category != nil
        @products = @category.products
      else
        @products = []
      end
    elsif params[:tah] && params[:tag].length < #
      @error_message = "Enter a topic with 3 or more characters!"
      @products = Product.all.order(updated_at: :desc)
    else  
        @products = Product.all.order(updated_at: :desc)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new

    @categories = Category.all


  end 

  def create
    product = Product.create(name: params[:name],
                             description: params[:description],
                             price: params[:price],
                             image_url: params[:image_url],
                             category_id: params[:category_id]
                            )
    redirect_to "/products"
  end


  def edit
    @categories = Category.all
    id = params[:id]
    @product = Product.find(id)
  end


  def update
    product = Product.find(params[:id])
    product.update(name: params[:name],
                  description: params[:description],
                  price: params[:price],
                  image_url: params[:image_url],
                  category_id: params[:category_id]
                  )
    redirect_to "/products/#{product.id}"
  end

  def destroy
    Product.find(params[:id]).destroy

    redirect_to "/products"

  end
end
