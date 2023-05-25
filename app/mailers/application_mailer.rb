class ApplicationMailer < ActionMailer::Base
  # 本番環境では、user@realdomain.comを自分のメールアドレスに変える
  default from: "user@realdomain.com" 
  layout "mailer"
end
