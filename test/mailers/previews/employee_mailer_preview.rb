class EmployeeMailerPreview < ActionMailer::Preview

  def employee_registered_email
    employee = Employee.new(:first_name => 'Daniel', :last_name => 'Reinhold', :username => 'daniel-reinhold', :email => 'daniel.reinhold261201@gmail.com')

    EmployeeMailer.with(:employee => employee).employee_registered_email
  end

end
