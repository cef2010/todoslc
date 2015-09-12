class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :address, :city, :state, :zip_code, :photo, :email, :password, :password_confirmation)
  end


end
