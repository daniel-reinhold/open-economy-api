module ApplicationHelper


  ##
  # Turns an ActiveRecord Object or a ActiveRecord Relation into a JSON Object and formats it <br />
  # Author: Daniel Reinhold <br />
  # Version: 1.0 <br />
  #
  # object The object which should be formatted <br />
  # <b>Parameter</b> include An array of symbols which holds the fields which should be included in the Hash <br />
  # <b>Parameter</b> exclude An array of symbols which holds the fields which shouldn't be included in the Hash <br />
  # <b>Parameter</b> methods An array of symbols which holds the ActiveModel methods, which should be included in the Hash <br />
  # <b>Parameter</b> Array of JSON Objects or a single JSON Object, depending on the object parameter
  def formatted(object, include = [], exclude = [], methods = [])
    object.to_json(:only => include, :except => exclude, :methods => methods)
  end

  # Renders a JSON Object which represents a error message
  # @author Daniel Reinhold
  # @version 1.0
  #
  # @param [String] message The message which should be displayed
  # @param [Int] status The HTTP Status Code which should be returned }
  def error(message, status = 400)
    render :json => {:error => message}, :status => status
  end

  def not_found(object)
    error(object.to_s + ' not found', 404)
  end

end