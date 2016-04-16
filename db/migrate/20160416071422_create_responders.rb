class CreateResponders < ActiveRecord::Migration
  def self.up
    create_table :responders do |t|
      t.string :type
      t.string :name
      t.integer :capacity
      t.boolean :on_duty
      t.timestamps
    end
  end
  def self.down
    drop_table :responders
  end
end
