class HomeController < ApplicationController
  def index
  	@areas = Area.all
  	if params[:filter]
      @a = params[:filter].to_date
      @orders = Order.where(c_date: @a)
    else
      @orders = Order.where(c_date: Date.today)
    end
  end
end
