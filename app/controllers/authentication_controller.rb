class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateEmployee.call(params[:username], params[:password])

    if command.success?
      render :json => {:auth_token => command.result}
    else
      render :json => {:error => command.errors}, :status => 401
    end
  end
end
