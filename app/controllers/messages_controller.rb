class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end


  # POST /messages or /messages.json
  def create
    @chat = Chat.includes(:recipient).find(params[:chat_id])
   @message = @chat.messages.create(message_params)

   respond_to do |format|
     format.js
   end

    respond_to do |format|

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content,:user_id)
    end
end
