class AddReferenceOfUsers < ActiveRecord::Migration[5.1]
  def change
  	add_reference :offers, :user, index: true
  	add_reference :proposals, :user, index: true
  end
end
