class UsersController < ApplicationController

    #Signup page
    get '/signup' do
        if logged_in?
            redirect to '/workouts'
        else
            erb :'/users/create'
        end
    end

    #signup post
    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/signup'
        else
            @user = User.create(
                :username => params[:username]
                :email => params[:email]
                :password => params[:password]
            )
            session[:user_id] = @user.id 
            redirect to '/workouts'
        end
    end

    #login page
    get '/login' do
      if logged_in
        @user = current_user
        redirect to "/users/#{@user.slug}"
      else
        erb :"/users/login"
      end
    end  

    #login post
    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/users/#{@user.slug}"
        else
            flash[:message] = "***Incorrect username or password, please try again!***"
            erb :"/users/login"
        end
    end

    #show page
    

end