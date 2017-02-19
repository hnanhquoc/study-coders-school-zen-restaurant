class HomeController < ApplicationController
  respond_to :html, :js

  def index
  end

  def contact_us
  end

  def menu
  	@sections = Section.all
    if params[:search].present?
      @food_items = FoodItem.search(params[:search])
      return
    end
    if params[:section_id].present?
      @current_section = Section.find(params[:section_id])
      @food_items = @current_section.food_items
    else
      @food_items = FoodItem.all
    end
    if params[:sort_column].present? && params[:sort_direction].present?
      @food_items = @food_items.order("#{params[:sort_column]} #{params[:sort_direction]}")
    end
  end

  def item_detail
    if params[:item_detail_id].present?
      @selected_food_item = FoodItem.find(params[:item_detail_id])
      puts @selected_food_item.views
      @selected_food_item.views += 1
      @selected_food_item.save!
    end

    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript' }
      format.html
    end
  end

end
