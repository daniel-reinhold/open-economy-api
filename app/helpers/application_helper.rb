module ApplicationHelper

  def formatted(object, default = [], except = [], methods = [])
    return object.to_json(:only => default, :except => except, :methods => methods)
  end

  def error(message, status = 400)
    return render :json => {:error => message}, :status => status
  end

  def not_found(object)
    error(object.to_s + ' not found', 404)
  end

end