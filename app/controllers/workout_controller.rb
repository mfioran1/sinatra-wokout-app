class WorkoutController < ApplicationController

    get '/workouts' do
        if logged_in?
            @user = current_user
            erb :'/workouts/index'
        else
            redirect to '/login'
        end
    end


end