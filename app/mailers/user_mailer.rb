class UserMailer < ActionMailer::Base
    default from: 'bindsoni1998@gmail.com'
  
    def welcome_email(user)
      @user = user
      mail(to: user.email, subject: 'Welcome to Our App')
    end
  end