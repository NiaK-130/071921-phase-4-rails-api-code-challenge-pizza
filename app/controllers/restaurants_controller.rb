class RestaurantsController < ApplicationController

    
    def index
        render json: Restaurant.all
    end


    def show
        restaurant = Restaurant.find_by_id(params[:id])
        if restaurant
            render json: restaurant, include: :pizzas
        else
            render json: {error: "Restaurant not found"}, status: :not_found
        end
    end


    def destroy
        restaurant = Restaurant.find_by_id(params[:id])
        if restaurant
            restaurant.destroy
        else
            render json: {error: "Restaurant not found"}, status: 404
    end

end



end
