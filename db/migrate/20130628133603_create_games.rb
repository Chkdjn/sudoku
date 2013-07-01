class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :initial_state, :null => false
      t.string :state
	  t.integer :user_id
      t.date :completed_at

      t.timestamps
	end
	add_index :games, :user_id
  end
end
