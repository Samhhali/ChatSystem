class ChatsController < ApplicationController

  before_action :set_chat, only: %i[ show edit update destroy ]

  # GET /chats or /chats.json
  def index
    @chats = Chat.all
  end

  # GET /chats/1 or /chats/1.json
  def show
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  #def edit
  #end

  # POST /chats or /chats.json
  def create
    #@chat = Chat.new(chat_params)
    @chat = Chat.get(current_user.id, params[:user_id])

    add_to_chats unless chated?

    respond_to do |format|
      format.js
    end
  end

  #removes the requested chat_id from the session and closes a window on the front-end.
  def close
    @chat = Chat.find(params[:id])

    session[:chats].delete(@chat.id)

    respond_to do |format|
      format.js
    end
  end

  # PATCH/PUT /chats/1 or /chats/1.json
=beging  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: "Chat was successfully updated." }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1 or /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: "Chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  =end
  private
    # Use callbacks to share common setup or constraints between actions.
    def add_to_chats
      session[:chats] || []
      session[:chats] << @chat.id
    end
    def chated
      session[:chats].include?(@chat.id)
    end
    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:number, :application_id)
    end
end
