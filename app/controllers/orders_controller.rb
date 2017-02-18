class OrdersController < ApplicationController

	def new
		@food_item = FoodItem.find(params[:food_item_id])
		@order = @food_item.orders.build
	end

	def create
		@food_item = FoodItem.find(params[:food_item_id])
		@order = @food_item.orders.build order_params
		if @order.save
			# Do something
			# flash[:success] = .
			redirect_to menu_path, falsh: {success: "Save successful"}
		else
			# Do other things
			render 'new'
		end
	end

	def order_params
		params.require(:order).permit(:quantity)
	end
end
