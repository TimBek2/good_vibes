class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true, null: false
      t.string :email, unique: true, index: true, null: false
      t.string :password_digest
      t.text :prompt

      t.timestamps null: false
    end
  end
end
