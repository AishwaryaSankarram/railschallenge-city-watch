class RenameColumnTypeInResponders < ActiveRecord::Migration
  def change
    rename_column :responders, :type, :rescue_type
  end
end
