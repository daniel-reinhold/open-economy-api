class Employee < ApplicationRecord
  has_secure_password

  #<editor-fold desc="Validations" defaultstate="collapsed">

  validates(
      :first_name,
      :last_name,
      :username,
      :email,
      :date_of_birth,
      :presence => {
          :message => I18n.t("errors.not_present")
      }
  )

  validates(
      :password,
      :presence => {
          :message => I18n.t("errors.not_present")
      },
      :on => :create
  )

  #  validates(
  #    :username,
  #    :email,
  #    :uniqueness => {
  #        :message => I18n.t("errors.not_unique")
  #   }
  #)

  #</editor-fold>

end
