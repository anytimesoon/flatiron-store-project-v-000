class CreateItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.string :title
  		t.integer :category_id
  		t.decimal :price
  		t.integer :inventory, default: 0, null: false
  	end
  end
end
