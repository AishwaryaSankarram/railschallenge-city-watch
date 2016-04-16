class CreateEmergencies < ActiveRecord::Migration
  def self.up
    create_table :emergencies do |t|
      t.string :code
      t.string :fire_severity
      t.string :police_severity
      t.string :medical_severity
      t.datetime :resolved_at

      t.timestamps
    end
  end
  def self.down
    drop_table :emergencies
  end
end
