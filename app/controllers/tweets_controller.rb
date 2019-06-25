class TweetsController < ApplicationController
  
  
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @tweet = Tweet.includes(:user).order("updated_at DESC").page(params[:page]).per(5)
  end
  
  def new
  end
  
  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end  
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if  tweet.user_id = current_user.id
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end
  
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end
    
  private
  def tweet_params
    params.permit(:text, :image)
  end
  
  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
