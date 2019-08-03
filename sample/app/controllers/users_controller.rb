class UsersController < ApplicationController
    
    #before_action:authenticate_user,{only:[:index,:show,:edit,:update]}
    before_action:forbid_login_user,{only:[:new,:create,:login_form,:login]}
    before_action:ensure_login_user,{only:[:edit,:update]}
    
    def ensure_login_user
        if @login_user.id != params[:id].to_i
            flash[:noice] = "権限がありません"
            redirect_to("/posts/index")
        end
    end
    
    def new
    end
    
    def index
        @users = User.all
    end
    
    def create
        @user= User.new(name: params[:name], email: params[:email], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect_to("/users/#{@user.id}")
        else
            render("users/new")
        end
    end
    
    def show
        @user = User.find_by(id: params[:id])
    end
    
    def edit
        @user = User.find_by(id: params[:id])
    end
    
    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to("/users/index")
    end
    
    def update
        @user = User.find_by(id: params[:id])
        @user.name = params[:name]
        @user.email = params[:email]
        @user.save
        redirect_to("/users/#{@user.id}")
    end
    
    def login_form
    end
       
    def login
        @user = User.find_by(email: params[:email],password: params[:password])
        if @user
            session[:user_id] = @user.id
            flash[:notice] = "ログインしました"
            redirect_to("/posts/index")
        else
            @error_message = "メールアドレスかパスワードが間違っています"
            @email = params[:email]
            @password = params[:password]
            render("users/login_form")
        end
    end
    
    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/login")
    end
        
end
