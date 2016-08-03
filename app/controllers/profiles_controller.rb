class ProfilesController < OpenReadController
    before_action :set_profile, only: [:update, :destroy]

  # GET all profiles
  def index
    @profiles = Profile.all

    render json: @profiles
  end

 # GET a single profile
  def show
    if @profiles = Profile.find(params[:id])
      render json: @profiles
    else
      render json: "error", status: :unprocessable_entity
    end
  end

 # POST /profile
  def create
    @profile = current_user.create_profile(profile_params)

    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end


# PATCH profile
  def update
    if @profile.update(profile_params)
      head :no_content
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE profile,  this will destroy the profile for the current user
  def destroy
    @profile.destroy

    head :no_content
  end

  def set_profile
    @profile = Profile.find(params[:id])
    # migt want to consider allowing the current user to be the only person to delete or update a profile
    #@profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :user_name, :street_address, :city, :state, :zip_code, :user_id)
  end

  private :set_profile, :profile_params

end
