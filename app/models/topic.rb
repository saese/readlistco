class Topic < ActiveRecord::Base
	belongs_to :user
	has_many :subtopics
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :content, presence: true, length: {maximum: 500}
end
