class ApplicationMailer < ActionMailer::Base
  # 本番環境では、user@realdomain.comを自分のメールアドレスに変える
  default from: "kano@netlab.jp" 
  layout "mailer"
end
