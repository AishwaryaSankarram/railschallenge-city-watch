class CreateEmergencies < ActiveRecord::Migration
  def self.up
    create_table :emergencies do |t|
      t.string :type
      t.string :severity
      t.string :reported_by
      t.string :status

      t.timestamps
    end
  end
  def self.down
    drop_table :emergencies
  end
end
