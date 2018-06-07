class RegistrationsController < Devise::RegistrationsController


 def create
    if verify_recaptcha
      super
    else
      build_resource(sign_up_params)
      resource.validate
      
      clean_up_passwords resource
      render 'new'
    end
  end

private

  def sign_up_params
    params.require(:user).permit( :name, 
                                  :email, 
                                  :password, 
                                  :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit( :name, 
                                  :email, 
                                  :password, 
                                  :password_confirmation, 
                                  :current_password)
  end



  
end