class EmployeeMailer < ApplicationMailer

  def employee_registered_email(employee)
    @employee = employee

    mail(:to => @employee.email, :subject => 'Registration')
  end

end
