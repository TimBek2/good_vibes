class User < ActiveRecord::Base
	has_secure_password

	has_many :conversations, foreign_key: :sender_id

	validates :username, :email, uniqueness: true, presence: true

end
