class ApplicationController < ActionController::Base
    include SessionHelper

    before_action :require_login

    add_flash_types :danger, :info, :warning, :success
    
    private

    def require_login
        redirect_to session_login_url unless signed_in?
    end

end
