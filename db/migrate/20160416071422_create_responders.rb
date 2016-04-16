class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders do |t|
      t.string :type
      t.integer :status

      t.timestamps null: false
    end
  end
end
