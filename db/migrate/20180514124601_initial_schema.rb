class InitialSchema < ActiveRecord::Migration[5.0]
  def change

  	create_table :offers do |t|
  		t.string :concert
  		t.text :description
  		t.text :route
  		t.integer :price
  		t.string :location
  		t.boolean :open, default: true
  		t.integer :awarded_proposal
  		t.timestamps
  	end

  	create_table :proposals do |t|
  		t.integer :bid
  		t.text :description
  		t.timestamps
  	end

  	add_reference :proposals, :offer, index: true
  	
  end
end
