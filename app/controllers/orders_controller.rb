class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if params[:search]
      @orders = Order.search(params[:search]).order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
    elsif params[:filter]
      @a = params[:filter].to_date
      @orderss = Order.where(c_date: @a).order('created_at ASC')
      @orders = @orderss.paginate(:page => params[:page], :per_page => 20)
    else
      @orders = Order.all.order('created_at DESC')
      @orders = @orders.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def all
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @runners = Runner.all
    @runnerlist = Array.new
    @runners.each do |z|
      @runnerlist << z.runner_name
    end
    @areas = Area.all
    @arealist = Array.new
    @areas.each do |x|
      @arealist << x.name
    end
    # byebug
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.paid = false
      if @order.c_date == nil
        @order.c_date = Date.today
      end
    @beforegst = @order.subtotal+@order.delivery
    @order.gst = @beforegst*0.06
      if @order.discount != nil or @order.discount != 0
        @beforegst = @beforegst-@order.discount
      end
    @order.sales = @order.gst+@beforegst
    @order.profit = @order.sales-@order.cost
    @runner = Runner.find_by(runner_name: @order.runner)
    @order.runner_id = @runner.id
    @area = Area.find_by(name: @order.area)
    @order.area_id = @area.id
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @orders }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_id, :sales, :cost, :delivery, :runner_id, :profit, :gst, :discount, :area_id, :subtotal, :c_date, :area, :runner)
    end
end
