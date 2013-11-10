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
  	@tlink = @subtopic.tlinks.create(tlink_params)
  	if @tlink.save
  		redirect_to topic_subtopic_path(@subtopic.topic, @subtopic)
  	else
  		render "new"
  	end
  end


  def edit
  	@subtopic = Subtopic.find(params[:subtopic_id])
  	@tlink = @subtopic.tlinks.find(params[:id])

  end

  def update
    @subtopic = Subtopic.find(params[:subtopic_id])
    @tlink = @subtopic.tlinks.find(params[:id])
		@tlink.update_attributes(tlink_params)
		if @tlink.save
			redirect_to topic_subtopic_path(@subtopic.topic, @subtopic)
		else
      flash[:notice] = "Could not be updated"
			render "edit"
		end
  end


  def destroy
    @subtopic = Subtopic.find(params[:subtopic_id])
    @tlink = @subtopic.tlinks.find(params[:id])
    @tlink.destroy
    redirect_to topic_subtopic_path(@subtopic.topic, @subtopic)
  end

  private

    def tlink_params
      params.require(:tlink).permit(:title, :content, :link)
    end
  
end
