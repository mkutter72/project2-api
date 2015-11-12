class PlonksController < OpenReadController
    before_action :set_plonk, only: [:update, :destroy]


  # GET /plonk
  def index
    if params[:variety] then
      @plonk = Plonk.where(variety: params[:variety])
        else if params[:city] then
          @plonk = Plonk.where(city: params[:city])
            else if  params[:user_id] then
              @plonk = Plonk.where(user_id: params[:user_id])
            else
              @plonk = Plonk.all
          end
        end
      end

    render json: @plonk
  end

  # GET /plonk/1
  def show
    @plonk = Plonk.find(params[:id])

    render json: @plonk
  end

# POST /plonks
  def create
    params[:plonk][:city] = current_user.profile.city
    params[:plonk][:zip_code] = current_user.profile.zip_code
    params[:plonk][:user_name] = current_user.profile.user_name
    @plonk = Plonk.create(plonk_params)

    if @plonk.save
      render json: @plonk, status: :created, location: @plonk
    else
      render json: @plonk.errors, status: :unprocessable_entity
    end
  end


  # PATCH plonk
  def update
    if current_user.id == @plonk.user_id then
      if @plonk.update(plonk_params)
        head :no_content
      else
        render json: @plonk.errors, status: :unprocessable_entity
      end
      head :no_content
    end
  end

  # DELETE plonk
  def destroy
    #only delete the plonk if it belong to the current user
    if current_user.id == @plonk.user_id then
      @plonk.destroy
    end

    head :no_content
  end

  def set_plonk
    @plonk = Plonk.find(params[:id])
  end


  def plonk_params
    params.require(:plonk).permit(:vineyard, :variety, :year, :number_of_bottles, :price, :will_trade, :city, :zip_code,:user_id, :user_name)
  end

  private :set_plonk, :plonk_params

end
