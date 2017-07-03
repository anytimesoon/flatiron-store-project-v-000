class CreateCarts < ActiveRecord::Migration
  def change
  	create_table :carts do |t|
  		t.integer :user_id
  		t.integer :status, default: 0, null: false
  	end
  end
end
