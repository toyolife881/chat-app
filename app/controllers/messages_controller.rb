class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    # ルームに紐づいているすべてのメッセージを、@messagesへ代入
    # メッセージに紐づくユーザー情報の取得に、メッセージの数と同じ回数のアクセスが必要になるので、N+1問題が発生するので、
    # includesメソッドで回避
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    # チャットルームに紐づいたメッセージのインスタンスを生成
    @message = @room.messages.new(message_params)
    if @message.save 
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private
  def message_params
    # ログインしているユーザーのidと紐づいている、メッセージの内容contentを受け取れるように許可
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end


end
