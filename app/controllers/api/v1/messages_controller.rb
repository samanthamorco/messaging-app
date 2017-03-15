class Api::V1::MessagesController < ApplicationController
  def index
    @messages = Message.all
    render "index.json.jbuilder"
  end

  def create
    @message = Message.create(
      body: params[:body],
      user_id: current_user.id
    )
    render "show.json.jbuilder"
  end
end
