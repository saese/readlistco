class Subtopic < ActiveRecord::Base
	belongs_to :topic
	has_many :tlinks
	default_scope -> { order('created_at DESC') }
	validates :title, presence:true, length: {minimum: 5}
	validates :content, presence: true
end
