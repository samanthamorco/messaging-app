class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render "index.html.erb"
  end

  def create
    @message = Message.create(
      body: params[:body],
      user_id: current_user.id
    )
    redirect_to "/messages"
  end
end
