class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
     puts "INCOMING PARAMS HERE: #{params}"

    @user = User.find_by(email: params[:sender])

    if @user
      @topic = Topic.find_or_create_by(title: params[:subject])
      @bookmark = Bookmark.new(url: params["stripped-text"])
      @bookmark.user = @user
      @bookmark.topic = @topic
      @bookmark.save
    end
    head 200
  end
end
