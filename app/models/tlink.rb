class Tlink < ActiveRecord::Base
	belongs_to :subtopic
	default_scope -> { order('created_at DESC') }
	validates :title, presence:true, length: {minimum: 5}
	validates :content, presence: true
	validates :link, presence: true
end
