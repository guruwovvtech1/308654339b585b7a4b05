class Api::UsersController < ApplicationController
	before_action :get_user, only: [:update, :show, :destroy]
	
	def index
		@users = User.all.page(params[:page]).per(3)
		render :json => { users: @users.api_format, total_pages: @users.total_pages }
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render :json => {user: @user.api_format}
		else
			render :json => {message: "somthing went wrong"}
		end
	end

	def update
		if @user.update(user_params)
			render :json => {user: @user.api_format}
		else
			render :json => {message: "somthing went wrong"}
		end
	end

	def show
		if @user.present?
      render :json => { user: @user.api_format }
    else
    	render :json => {message: "record not found"}
    end
	end

  def destroy
  	if @user.destroy
      render :json => {user: [], status: "success"}
  	else
  		render :json => {message: "somthing went wrong"}
  	end
  end

  def typeahead
  	@users = User.all.where('first_name LIKE ? OR last_name LIKE ? OR email LIKE ?', "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%")
  	render :json => { users: @users.api_format }
  end

	private

	def get_user
		@user = User.find_by(id: params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :first_name, :last_name)
	end

end
