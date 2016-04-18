class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.references :conversation, index: true
    	t.text :body, presence: true
    end
  end
end
