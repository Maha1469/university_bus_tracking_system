class Student < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :roll_number, presence: true
  validates :batch_number, presence: true
  validates :semseter, presence: true
  validates :department, presence: true
end
