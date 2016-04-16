class Responder < ActiveRecord::Base
  belongs_to :emergency, primary_key: 'code'
  belongs_to :emergency, class_name: 'Emergency', foreign_key: :emergency_code
  validates_presence_of :name, :rescue_type, :capacity
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates_uniqueness_of :name
end