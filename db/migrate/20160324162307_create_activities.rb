class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :arts
      t.string :sports
      t.belongs_to :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
