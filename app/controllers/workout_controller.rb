class WorkoutController < ApplicationController

    #all
    get '/workouts' do
        if logged_in?
            @user = current_user
            erb :'/workouts/index'
        else
            redirect to '/login'
        end
    end

    #new workout
    get '/workouts/new' do
        if logged_in?
            erb :'/workouts/new'
        else
            redirect to '/login'
        end
    end

    #post workout
    post '/workouts' do
        if params[:title] == ""
            redirect to '/workouts/new'
        else
            @workout = Workout.create(
                :title => params[:title],
                :duration => params[:duration],
                :level => params[:level],
                :details => params[:details],
                :comments => params[:comments]
            )
            @workout.user_id = current_user.id 
            @workout.save
            redirect to "/workouts/#{@workout.id}"
        end
    end

    #show workout
    get '/workouts/:id' do
        if logged_in?
          @workout = Workout.find(params[:id])
          erb :'/workouts/show'
        else
          redirect to "/login"
        end
    end


    #edit workout
    get '/workouts/:id/edit' do
        @workout = Workout.find_by(id: params[:id])
        if current_user.id == @workout.user_id
          erb :'/workouts/edit'
        else
          flash[:edit] = "***That Is Not Yours. You Can Not Edit A Post That Doesn't Belong To You!***"
          erb :'/workouts/show'
        end
      end

    #post edit
    patch '/workouts/:id' do
        @workout = Workout.find(params[:id])
        if params[:title] == ""
          redirect to "/workouts/#{@workout.id}/edit"
        else
          @workout.title = params["title"]
          @workout.details = params["details"]
          @workout.duration = params["duration"]
          @workout.level = params["level"]
          @workout.comments = params["comments"]
          @workout.save
          redirect to "/workouts/#{@workout.id}"
        end
      end

    #delete workout
    delete '/workouts/:id' do
        @workout = Workout.find_by_id(params[:id])
        if @workout.user_id == current_user.id
          @workout.delete
        end
          redirect to "/workouts"
    end



end