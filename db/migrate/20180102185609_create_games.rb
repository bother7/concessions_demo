class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :date
      t.string :start_time
      t.string :name
      t.string :current_period
      t.boolean :food, :default => true
      t.boolean :drinks, :default => true
      t.boolean :snacks, :default => true
      t.boolean :alcohol, :default => true
      t.integer :stadium_id
      t.timestamps
    end
  end
end
