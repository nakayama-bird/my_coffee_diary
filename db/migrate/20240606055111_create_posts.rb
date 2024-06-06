class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :drink_type,  null: false, default: 0
      t.integer :drink_time,  null: false, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
