class ContactsController < ApplicationController
    before_action :require_login
    
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(params[:contact])
        @contact.request = request
        @counter = Clicker.find_or_create_by(dates: Date.today)
        if @contact.deliver
            flash.now[:error] = nil
            @counter.clickers += 1
            @counter.save!
        else
            flash.now[:error] = 'Cannot send message.'
            render :new
        end

    end
end
