module Api
    module V1
        class UsersdataController < ApplicationController
            def index
                users = User.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded articles', data: users}, status: :ok
            end
        end
    end
end