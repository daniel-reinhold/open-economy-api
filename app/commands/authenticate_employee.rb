class AuthenticateEmployee
  prepend SimpleCommand

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    JsonWebToken.encode(:employee_id => employee.id) if employee
  end

  private

  attr_accessor :username, :password

  def employee
    employee = Employee.find_by(:username => username)
    return employee if employee && employee.authenticate(password)

    errors.add(:user_authentication, 'Invalid credentials')
    nil
  end
end