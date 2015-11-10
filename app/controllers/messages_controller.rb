class MessagesController < OpenReadController
    before_action :set_message, only: [:update, :destroy]

  # GET all messages
  def index
    @messages = Message.all

    render json: @messages
  end


 # GET changed functionality - get all messages associated with a user
  def show
    @message = User.find(params[:id]).messages

    render json: @message
  end


# POST /messages
  def create
    @message = Message.create(message_params)

    # profile = profiles.find_by_user_name(message_params[:receiver_user_name])
    # params[:user_id] = profile.user_id
    # save the user from typing in their username,   look it up and set field before save
    #@user_name = User.find(message_params[:user_id]).profile.user_name

    # @profile = User.find(params[:user_id]).profile
    # @user_name = @profile[:user_name]
    # render json: @user_name

    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end

  end

# PATCH message
  def update
    if @message.update(message_params)
      head :no_content
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE message
  def destroy
    @messages = User.find(params[:id]).messages
    @messages.destroy

    head :no_content
  end


  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:sender_user_name, :receiver_user_name, :plonk_message, :user_id)
  end

  private :set_message, :message_params

end
