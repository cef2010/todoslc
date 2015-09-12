class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.belongs_to :user
      t.belongs_to :review
      t.text :body

      t.timestamps null: false
    end
  end
end
