class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :exercise_id
      t.integer :calendar_id

      t.timestamps
    end
  end
end
