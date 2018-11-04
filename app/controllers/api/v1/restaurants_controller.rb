class Api::V1::RestaurantsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if (@restaurant.update restaurant_params)
      render :show
    else
      render_error
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
      if (@restaurant.save restaurant_params)
        render :show
      else
        render_error
      end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :image)
  end

  def render_error
    render json: { errors: @restaurant.error.full_messages },
      status: :unprocessable_entity
  end

end
