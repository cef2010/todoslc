class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :tags, array:true
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.text :description
      t.string :phone_number
      t.integer :rating

      t.timestamps null: false
    end
  end
end
