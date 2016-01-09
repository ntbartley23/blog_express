class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :user_id
    	t.string :comment_body
    	t.integer :post_id

      t.timestamps null: false
    end
  end
end
