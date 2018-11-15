class GraphController < ApplicationController
    def index
        @clicker = Clicker.all

        respond_to do |format|
            format.html
        end
    end
end
