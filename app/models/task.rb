class Task < ApplicationRecord
	validates :content, presence: true, length: {minimum: 5}
	validates :comment, presence: true, length: {minimum: 5}
	 
	
end
