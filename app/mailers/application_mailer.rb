class ApplicationMailer < ActionMailer::Base
  default :from => 'do-not-reply@openeconomy.com'
  layout('mailer')
end
