class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
    	t.references :sender, index: true, null: false
    	t.references :receiver, index: true, null: false

    	t.timestamps
    end
  end
end
