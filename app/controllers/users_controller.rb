class UsersController < ApplicationController
  add_flash_types :info, :error, :warning
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.alert = "Welcome to Alpha blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_article
  #   @article = Article.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end