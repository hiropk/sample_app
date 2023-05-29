class UserMailer < ApplicationMailer

  # emailの有効化の場合
  def account_activation(user)
    @user = user 
    mail to: @user.email, subject: "Account activation"
  end

  # パスワードのリセット処理の場合
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
