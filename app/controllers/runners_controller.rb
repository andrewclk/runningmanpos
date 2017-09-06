class RunnersController < ApplicationController
  before_action :set_runner, only: [:show, :edit, :update, :destroy]

  # GET /runners
  # GET /runners.json
  def index
    @runners = Runner.all
    @runners.each do |x|
      @orderss = Order.where(runner_id: x.id)
      @orders = @orderss.where(paid: false)
      if @orders != nil
        @total = Array.new
          @orders.each do |z|
            @total << z.profit
          end
        
        @sum = 0
          @total.each do |s|
            @sum += s
          end
        
        x.balance = @sum
        x.save
      end
    end
  end

  # GET /runners/1
  # GET /runners/1.json
  def show
    @runner = Runner.find(@runner.id)
    if params[:filter]
      @a = params[:filter].to_date
      @ordersz = Order.where(runner_id: @runner.id)
      @orderss = @ordersz.where(c_date: @a)

    else
      @orderss = Order.where(runner_id: @runner.id)
    end
      @orders = @orderss.where(paid: false)
      @total = Array.new
      @orders.each do |x|
        @total << x.profit
      end
      @sum = 0
      @total.each do |s|
        @sum += s
      end
    @runner.balance = @sum
    @runner.save
  end

  # GET /runners/new
  def new
    @runner = Runner.new
  end

  # GET /runners/1/edit
  def edit
  end

  def pay
    if params[:id][1] != nil
        z = params[:id][1].to_date
        x = params[:id][0].to_i
        @runner = Runner.find(x)
        @today = Order.where(c_date: z)
        @sent = @today.where(runner_id: @runner)
        @clear = @sent.where(paid: false)
        @clear.each do |d|
          d.paid = true
          d.save
      end
    else
        x = params[:id][0].to_i
        @runner = Runner.find(x)
        @sent = Order.where(runner_id: @runner)
        @clear = @sent.where(paid: false)
        @clear.each do |d|
          d.paid = true
          d.save
        end
    end
    respond_to do |format|
        format.html { redirect_to :back, notice: 'Payment was successfully made.' }
        format.json { render :index, status: :created }
    end
  end

  # POST /runners
  # POST /runners.json
  def create
    @runner = Runner.new(runner_params)
    @runner.status = true
    @area = Area.find_by(name: @runner.area)
    @runner.area_id = @area.id
    respond_to do |format|
      if @runner.save
        format.html { redirect_to @runner, notice: 'Runner was successfully created.' }
        format.json { render :show, status: :created, location: @runner }
      else
        format.html { render :new }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runners/1
  # PATCH/PUT /runners/1.json
  def update
    respond_to do |format|
      if @runner.update(runner_params)
        format.html { redirect_to @runner, notice: 'Runner was successfully updated.' }
        format.json { render :show, status: :ok, location: @runner }
      else
        format.html { render :edit }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runners/1
  # DELETE /runners/1.json
  def destroy
    @runner.destroy
    respond_to do |format|
      format.html { redirect_to runners_url, notice: 'Runner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runner
      @runner = Runner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def runner_params
      params.require(:runner).permit(:runner_name, :area_id, :area, :status, :balance)
    end
end
