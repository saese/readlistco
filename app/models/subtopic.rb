class Subtopic < ActiveRecord::Base
	belongs_to :topic
	validates :title, presence:true, length: {minimum: 5}
	validates :content, presence: true
end
