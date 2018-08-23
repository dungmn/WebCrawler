class CreateTrendings < ActiveRecord::Migration[5.2]
  def change
    create_table :trendings do |t|
      t.string :title
      t.integer :points
      t.string :comment
      t.string :image_url

      t.timestamps
    end
  end
end
