class User < ApplicationRecord
	has_many :messages
	has_many :chat_groups, through: :messages

	validates :username, presence: true, uniqueness: true
end