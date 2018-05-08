class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
    @drivers = User.where(role: 1).count
    @buses = Bus.all.count
    @active = Bus.where(status: true).count
    @unactive = Bus.where(status: false).count
  end
end
