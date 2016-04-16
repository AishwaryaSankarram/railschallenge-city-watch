class Emergency < ActiveRecord::Base
  self.primary_key = 'code'
  validates_presence_of  :code, :fire_severity, :medical_severity, :police_severity
  validates_uniqueness_of :code
  validates  :fire_severity, :medical_severity, :police_severity, numericality: { only_integer: true, greater_than_or_equal_to: 0}
end
