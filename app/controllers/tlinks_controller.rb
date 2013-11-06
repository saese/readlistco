class TlinksController < ApplicationController
  def new
  	# @topic = Topic.find(params[:topic_id])
		@subtopic = Subtopic.find(params[:subtopic_id])
  	@tlink = @subtopic.tlinks.new
  end

  # def index
  # 	@subtopic = Subtopic.find(params[:id])
  # 	@tlink =Tlink.all
  # end

  def create
  	@subtopic = Subtopic.find(params[:subtopic_id])
  	@tlink = @subtopic.tlinks.create(params[:tlink].permit(:title, :content, :link))
  	if @tlink.save
  		redirect_to topic_subtopic_path(@subtopic.topic, @subtopic)
  	else
  		render "new"
  	end
  end


  def edit
  	@subtopic = Tlink.subtopic.find(:subtopic_id)
  	@tlink = @subtopic.find(param[:id])
  end

  def update
		@subtopic = Tlink.subtopic.find(:subtopic_id)
		@tlink = @subtopic.find(param[:id])
		@tlink.update_attributes(params[:tlink].permit(:title, :content))
		if @tlink.save
			redirect_to @subtopic
		else
			render "edit"
		end
  end


  def destroy
  end
end
