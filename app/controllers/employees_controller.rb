class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  DEFAULT_FIELDS = [:id, :first_name, :last_name, :username, :email, :email, :date_of_birth]

  # GET /employees
  def index
    @employees = Employee.all

    Rails.logger.error(Employee.all.class)

    render :json => formatted(@employees, DEFAULT_FIELDS), :status => 200
  end

  # GET /employees/1/show
  def show
    render :json => formatted(@employee, DEFAULT_FIELDS), :status => 200
  end

  # POST /employees/create
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      EmployeeMailer.employee_registered_email(@employee).deliver_later

      render :json => formatted(@employee, DEFAULT_FIELDS), :status => 201
    else
      render :json => @employee.errors, :status => :unprocessable_entity
    end
  end

  # PATCH /employees/1/update
  def update
    if @employee.update(employee_params)
      render :json => formatted(@employee, DEFAULT_FIELDS)
    else
      render :json => @employee.errors, :status => 400
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      begin
        @employee = Employee.find(params[:id])
      rescue
        not_found(Employee)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.permit(:first_name, :last_name, :username, :email, :date_of_birth, :password)
    end
end
