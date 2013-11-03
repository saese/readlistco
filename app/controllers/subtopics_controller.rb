class SubtopicsController < ApplicationController

	def new
		@topic = Topic.find(params[:topic_id])
		@subtopic = @topic.subtopics.new
	end

	def create
		@topic = Topic.find(params[:topic_id])
		@subtopic = @topic.subtopics.create(params[:subtopic].permit(:title, :content))
		if @subtopic.save
			redirect_to topic_path(@topic)
		else
			redirect_to "new"
		end
	end

	def edit
		@topic = Topic.find(params[:topic_id])
		@subtopic = @topic.subtopics.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:topic_id])
		@subtopic = @topic.subtopics.find(params[:id])
		@subtopic.update_attributes(params[:subtopic].permit(:title, :content))
		if @subtopic.save
			redirect_to topic_path(@topic)
		else
			flash[:notice] = "Could not be updated"
			render "edit"
		end
	end

	def destroy
		@topic = Topic.find(params[:topic_id])
		@subtopic = @topic.subtopics.find(params[:id])
		@subtopic.destroy
		redirect_to root_url
	end

end
