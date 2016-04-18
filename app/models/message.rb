class Message < ActiveRecord::Base
	belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
	belongs_to :receiver, foreign_key: :receiver_id, class_name: 'User'

  validates_presence_of :body, :sender_id, :receiver_id
  validates_uniqueness_of :sender_id, scope: :receiver_id

    scope :involving, -> (user) do
    where("messages.sender_id =? OR messages.receiver_id =?",user.id,user.id)
  end

  scope :between, -> (sender_id,receiver_id) do
    where("(messages.sender_id = ? AND messages.receiver_id =?) OR (messages.sender_id = ? AND messages.receiver_id =?)", sender_id,receiver_id, receiver_id, sender_id)
  end
end
