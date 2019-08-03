class PostsController < ApplicationController
  
  #before_action:authenticate_user
  
  def index
    @posts=Datum.where(user_id: session[:user_id])
  end
  
  def new
  end
  
  def show
    @data = Datum.find_by(id: params[:id])
  end
  
  def edit
    @data = Datum.find_by(id: params[:id])
  end
  
  def update
    @data = Datum.find_by(id: params[:id])
    @data.content = params[:content]
    @data.save
    redirect_to("/posts/index")
  end
  
  def destroy
    @data = Datum.find_by(id: params[:id])
    @data.destroy
    redirect_to("/posts/index")
  end
  
  def create
    @data = Datum.new(content: params[:content],user_id: @login_user.id)
    if @data.save
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
end
