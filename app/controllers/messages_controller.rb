class MessagesController < OpenReadController
    before_action :set_message, only: [:update, :destroy]

  # GET all messages
  def index
    @messages = Message.all

    render json: @messages
  end


 # GET a single message
  def show
    @message = Message.find(params[:id])

    render json: @message
  end


# POST /messages
  def create
    # profile = profiles.find_by_user_name(message_params[:receiver_user_name])
    # params[:user_id] = profile.user_id

    @message = Message.create(message_params)

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
    @message.destroy

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
