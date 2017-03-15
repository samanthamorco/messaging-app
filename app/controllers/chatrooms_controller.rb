class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(id: params[:id])
  end

  def create
    @chatroom = Chatroom.create()
  end
end
