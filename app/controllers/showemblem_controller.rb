class ShowemblemController < ApplicationController
  skip_before_action :authenticate

  def index
  end

  def show
    @user = User.find(params[:id])
    @filename = "e" + @user.id.to_s + ".jpg"
    @initial = @user.name[0]
    @link = request.url
  end
end
