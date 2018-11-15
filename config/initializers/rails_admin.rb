RailsAdmin.config do |config|

  config.parent_controller = "::ApplicationController"
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.authorize_with do
    #True = Does not exist, False = Exist, unless executes if it is false then
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
  end

  config.current_user_method { current_user }

  ## With an audit adapter, you can add:
  # history_index
  # history_show

  config.model "User" do
    edit do
      field :admin
      field :email
      field :password
    end
  end
  
end
