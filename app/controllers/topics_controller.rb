class TopicsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

	def index
		@topics = Topic.all.paginate(page: params[:page])
	end

	def create
		@topic = current_user.topics.build (topic_params)
		if @topic.save
			flash[:success] = "Topic created!"
			redirect_to topic_path(@topic)
		else
      	@feed_items = []
			render 'static_pages/home'
		end
	end
	def edit
		@topic = Topic.find_by(id: params[:id])
	end

	def update
		@topic = Topic.find_by(id: params[:id])
		@topic.update_attributes(topic_params)
		if @topic.save
			redirect_to @topic
		else
			render "edit"
		end
	end

	def show
		@topic = Topic.find_by(id: params[:id])
	end

	def destroy
		@topic = Topic.find_by(id: params[:id])
		@topic.destroy
		flash[:notice] = "Topic deleted"
		redirect_to root_url
	end




	private
		def topic_params
			params.require(:topic).permit(:title, :content)
		end

		def correct_user
	      @topic = current_user.topics.find_by(id: params[:id])
	      redirect_to root_url if @topic.nil?
	  end
end