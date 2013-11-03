class StaticPagesController < ApplicationController
  def home
    @topic = current_user.topics.build if signed_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

end
