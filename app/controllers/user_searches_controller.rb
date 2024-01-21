class UserSearchesController < ApplicationController
    protect_from_forgery with: :null_session


    def new
        @user_search = UserSearch.new
    end
    
    def create
        @user_search = UserSearch.new(user_search_params)
    
        if @user_search.save
            # redirect_to root_path, notice: 'Search record saved successfully.'
            render json: { status: 'success', message: 'Search record saved successfully.', user_search: @user_search }
        else
            # render :new
            render json: { status: 'error', message: 'Error saving search record.', errors: @user_search.errors.full_messages }
        end
    end

    def update
        puts "ID--->: #{params[:id]}" # Debug print statement

        @user_search = UserSearch.find(params[:id])
    
        if @user_search.update(user_search_params)
          render json: { status: 'success', message: 'Search record updated successfully.', user_search: @user_search }
        else
          render json: { status: 'error', message: 'Error updating search record.', errors: @user_search.errors.full_messages }
        end
    end

    def search
        @user_searches = UserSearch.where(ip_address: params[:ip_address])
        render json: { status: 'success', user_searches: @user_searches }
    end
    
    private
    
    def user_search_params
        params.require(:user_search).permit(:ip_address, :search_query)
    end
end
    