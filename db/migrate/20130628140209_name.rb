class Name < ActiveRecord::Migration
  def change
	  remove_column :games, :user
	  add_column :games, :user_id, :integer
	  add_index :games, :user_id
  end
end
