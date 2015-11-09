class PlonksController < OpenReadController
    before_action :set_plonk, only: [:update, :destroy]


  # GET /plonk
  def index
    @plonk = Plonk.all

    render json: @plonk
  end

  # GET /plonk/1
  def show
    @plonk = Plonk.find(params[:id])

    render json: @plonk
  end

# POST /plonks
  def create
    @plonk = Plonk.create(plonk_params)

    if @plonk.save
      render json: @plonk, status: :created, location: @plonk
    else
      render json: @plonk.errors, status: :unprocessable_entity
    end

  end


  # PATCH message
  def update
    if @plonk.update(plonk_params)
      head :no_content
    else
      render json: @plonk.errors, status: :unprocessable_entity
    end
  end

  # DELETE message
  def destroy
    @plonk.destroy

    head :no_content
  end

  def set_plonk
    @plonk = Plonk.find(params[:id])
  end


  def plonk_params
    params.require(:plonk).permit(:vineyard, :variety, :year, :number_of_bottles, :price, :will_trade, :user_id)
  end

  private :set_plonk, :plonk_params

end
