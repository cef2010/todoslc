class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :activity
      t.belongs_to :user
      t.text :body
      t.integer :rating

      t.timestamps null: false
    end
  end
end
