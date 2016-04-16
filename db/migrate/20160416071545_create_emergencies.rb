class CreateEmergencies < ActiveRecord::Migration
  def change
    create_table :emergencies do |t|
      t.string :type
      t.string :severity
      t.string :reported_by
      t.string :status

      t.timestamps null: false
    end
  end
end
