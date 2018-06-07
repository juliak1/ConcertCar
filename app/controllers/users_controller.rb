class UsersController < ApplicationController
before_action :authenticate_user!
before_action :authenticate_admin!, except: [:show]
	def show
		@user = User.find(params[:id])
	end


	def authenticate_admin!
    unless current_user.admin
      redirect_back(fallback_location: root_path)
    end
  end

end