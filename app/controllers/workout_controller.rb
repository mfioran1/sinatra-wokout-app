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

    #show workout

    #edit workout

    #delete workout


end