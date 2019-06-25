class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: tweet_params[:text], tweet_id: tweet_params[:tweet_id], user_id: current_user.id )
    redirect_to "/tweets/#{@comment.tweet_id}"
  end
  
  private
  def tweet_params
    params.permit(:text, :tweet_id)
  end
  
end
