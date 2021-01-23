class ApplicationController < ActionController::API
  include ApplicationHelper

  before_action :set_header_for_each_request

  def set_header_for_each_request
    headers['Access-Control-Allow-Origin'] = '*'
  end

end
