class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :url
      t.decimal :price
      t.string :sku

      t.timestamps
    end
  end
end
