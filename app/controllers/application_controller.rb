class ApplicationController < ActionController::API
  include ApplicationHelper

  before_action :set_header_for_each_request, :authenticate_request
  attr_reader :current_employee

  def set_header_for_each_request
    headers['Access-Control-Allow-Origin'] = '*'
  end

  private

  def authenticate_request
    @current_employee = AuthorizeApiRequest::call(request.headers).result
    render :json => {:error => 'Not authorized'}, :status => 401 unless @current_employee
  end

end
