class ApplicationController < ActionController::Base
  before_action :authenticate_request
    attr_reader :current_user
    
    include ExceptionHandler
  require 'json_web_token'

    helper_method :current_user
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
      @current_user = nil
      end
    end
  
    
  
    # [...]
    private
    def authenticate_request
      @current_user = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end
