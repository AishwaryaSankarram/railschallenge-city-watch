class Responder < ActiveRecord::Base
  belongs_to :emergency, primary_key: 'code'
  belongs_to :emergency, class_name: 'Emergency', foreign_key: :emergency_code
end
