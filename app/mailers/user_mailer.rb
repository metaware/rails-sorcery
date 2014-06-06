class UserMailer < ActionMailer::Base
  default from: "test_auth@brainstation.it"

  def confirmation_email(user)
    @user = user
    mail(to: user.email, subject: "Confirm email for #{@user.email}")
  end

end