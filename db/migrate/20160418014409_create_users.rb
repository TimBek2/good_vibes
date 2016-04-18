class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, uniqueness: true, presence: true
      t.string :email, uniqueness: true, index: true, presence: true
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
