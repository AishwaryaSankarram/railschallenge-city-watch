class AddEmergencyCodeToResponders < ActiveRecord::Migration
  def change
    add_column :responders, :emergency_code, :string
    add_index :responders, :emergency_code
  end
end
