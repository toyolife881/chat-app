class MessagesController < ApplicationController
  def index
    # @messages = Message.all
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    # チャットルームに紐づいたメッセージのインスタンスを生成
    @message = @room.messages.new(message_params)
    if @message.save 
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

  private
  def message_params
    # ログインしているユーザーのidと紐づいている、メッセージの内容contentを受け取れるように許可
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end


end
