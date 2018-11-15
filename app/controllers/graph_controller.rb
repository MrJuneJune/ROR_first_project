class GraphController < ApplicationController
    config.parent_controller = "::ApplicationController"

    def index
        unless current_user.nil?
            #Check if it has admin
            unless current_user.admin?
            redirect_to(
                main_app.home_path,
                alert: "You are not permitted to view this page"
            )
            end
        #Need to log in
        else
            redirect_to(
                main_app.sign_in_path,
                alert: "Please sign in"
            )
        end
        @clicker = Clicker.all

        respond_to do |format|
            format.html
        end
    end
end
