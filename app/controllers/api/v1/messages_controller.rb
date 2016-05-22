class Api::V1::MessagesController < ApplicationController
  respond_to :json

  def index
    @messages = Message.all
    respond_with :api, :v1, @messages
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      respond_with :api, :v1, @message
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(params[:message])
      respond_with :api, :v1, @message
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      respond_with :api, :v1, { head: :ok }
    end
  end

  private

  def message_params
    params.require(:message).permit(:author,:text,:display_time)
  end
end
