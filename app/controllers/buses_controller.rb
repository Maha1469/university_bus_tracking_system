class BusesController < ApplicationController
  before_action :set_bus, only: [:show, :edit, :update, :destroy]

  # GET /buses
  # GET /buses.json
  def index
    @buses = Bus.all
  end

  # GET /buses/1
  # GET /buses/1.json
  def show
  end

  # GET /buses/new
  def new
    @user = User.new
    @bus = Bus.new
  end

  # GET /buses/1/edit
  def edit
    @bus = Bus.find(params[:id])
    @user = User.find(@bus.user_id)
  end

  # POST /buses
  # POST /buses.json
  def create
    @bus = Bus.new(bus_params)
    @user = User.new
    @user.email = params[:bus][:email]
    @user.password = params[:bus][:password]
    @user.password_confirmation = params[:bus][:password_confirmation]
    @user.role = 1
    if @user.save
      @bus.user_id = @user.id
      respond_to do |format|
        if @bus.save
          format.html { redirect_to buses_path, notice: 'Bus was successfully created.' }
          format.json { render :show, status: :created, location: @bus }
        else
          format.html { render :new }
          format.json { render json: @bus.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buses/1
  # PATCH/PUT /buses/1.json
  def update
    respond_to do |format|
      if @bus.update(bus_params)
        format.html { redirect_to @bus, notice: 'Bus was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus }
      else
        format.html { render :edit }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buses/1
  # DELETE /buses/1.json
  def destroy
    @bus.destroy
    respond_to do |format|
      format.html { redirect_to buses_url, notice: 'Bus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus
      @bus = Bus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_params
      params.require(:bus).permit(:bus_number, :email, :password,  :password_confirmation, :current_lat, :current_lan, :description, :evening_start_time, :evening_end_time, :morning_start_time, :morning_end_time, :status, :user_id)
    end
end
