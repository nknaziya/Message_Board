class Message < ApplicationRecord
	belongs_to :model
	has_many :comments
end
