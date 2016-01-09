class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
    	t.string :fname
    	t.string :lname
    	t.string :email

      t.timestamps null: false
    end
  end
end
