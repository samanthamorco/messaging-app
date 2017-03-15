class Api::V1::MessagesController < ApplicationController
  def index
    @messages = Message.where(chatroom_id: params[:chatroom_id])
    render "index.json.jbuilder"
  end

  def create
    @message = Message.create(
      body: params[:body],
      user_id: params[:user_id]
    )
    ActionCable.server.broadcast "activity_channel", {
      id: @message.id,
      name: @message.user.name,
      body: @message.body,
      created_at: @message.created_at
    }
    render "show.json.jbuilder"
  end
end
