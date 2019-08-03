class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action:set_login_user
  
  def set_login_user
      @login_user = User.find_by(id: session[:user_id])
  end
  
  #def authenticate_user
      #if @login_user == nil
     #     flash[:notice] = "ログインが必要です"
    #      redirect_to("/login")
   #   end
  #end
  
  def forbid_login_user
      if @login_user
          flash[:notice] = "ログイン中です"
          redirect_to("/posts/index")
      end
  end
  
end
