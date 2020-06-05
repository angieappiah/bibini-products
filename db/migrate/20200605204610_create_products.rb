class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :price
      t.integer :user_id
      t.string  :image
    end
  end
end
