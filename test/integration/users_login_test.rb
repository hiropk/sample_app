require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with valid emial/invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email, password: "invalid" } }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logput" do 
    post login_path, params: {session: { email:    @user.email, 
                                         password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    #login_pathがないかどうかをチェックする。
    #ログイン後はloginのメニューではなく、Acountsのメニューになるため。
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    #　メニューにはcurrent_userメソッドでログイン中のuserオブジェクトを返しており、profileにこのuser_path(@user)でリンク先を示している。
    assert_select "a[href=?]", user_path(@user)
    # deleteメソッドで、logout_pathで指定されたsessionsコントローラのdestroyアクションを呼び出す
    delete logout_path
    assert_not is_logged_in?
    assert_response :see_other
    assert_redirected_to root_path
    # 2番目のウィンドウでログアウトをクリックするユーザをシュミレートする
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end 
