class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :duration
      t.string :level
      t.string :details
      t.string :comments
      t.integer :user_id
    end
  end
end
