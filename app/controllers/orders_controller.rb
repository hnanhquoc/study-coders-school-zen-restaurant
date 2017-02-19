class OrdersController < ApplicationController

	def new
		@food_item = FoodItem.find(params[:food_item_id])
		@order = @food_item.orders.build
	end

	def create
		@food_item = FoodItem.find(params[:food_item_id])
		@order = @food_item.orders.build order_params
		@order.name = params[:name]
		@order.email = params[:email]
		@order.phone_number = params[:phone_number]
		@order.address = params[:address]
		if @order.save
			# Do something
			# flash[:success] = .
			redirect_to result_path(order_id: @order.id), flash: {success: "Save successful"}
		else
			# Do other things
			render 'new'
		end
	end

	def result
		@order = Order.find(params[:order_id])
		@food_item = @order.food_item
	end

	def order_params
		params.require(:order).permit(:quantity, :name, :email, :phone_number, :address)
	end
end
