class HomeController < ApplicationController
  def index
  	@orders = Order.all
  	@areas = Area.all
  end
end
