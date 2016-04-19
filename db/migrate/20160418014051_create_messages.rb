class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.text :body, null: false
    	t.references :sender, index: true, null: false
    	t.references :receiver, index: true, null: false

    	t.timestamps null: false
    end
  end
end
