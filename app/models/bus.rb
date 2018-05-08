class Bus < ApplicationRecord
  attr_accessor :email, :password,  :password_confirmation
  belongs_to :user
  validates :bus_number, presence: true
  validates :current_lat, presence: true
  validates :current_lan, presence: true
  validates :description, presence: true
  validates :evening_start_time, presence: true
  validates :evening_end_time, presence: true
  validates :morning_start_time, presence: true
  validates :morning_end_time, presence: true
end
