require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do 
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "shoul redirect update when not logged in" do 
    patch user_path(@user), params: { user: { name: @user.name, 
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "shoul not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
                                    user: { password: "password", 
                                            password_confirmation: "password", 
                                            admin: true } }
    assert_not @other_user.reload.admin?
  end

  test "should redirect index when not logged in" do 
    get users_path 
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do 
    assert_no_difference 'User.count' do 
      delete user_path(@user)
    end
    assert_response :see_other
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do 
    log_in_as(@other_user)
    assert_no_difference 'User.count' do 
      delete user_path(@user)
    end
    assert_response :see_other
    assert_redirected_to root_url
  end

  test "should redirect following when not logged in" do 
    get following_user_path(@user)
    assert_redirected_to login_url 
  end

  test "should redirect followers when not logged in" do 
    get followers_user_path(@user)
    assert_redirected_to login_url 
  end

  test "feed should have the right posts" do 
    michael = users(:michael)
    archer = users(:archer)
    lana = users(:lana)
    # フォローしているユーザの投稿を確認
    lana.microposts.each do |post_following| 
      assert michael.feed.include?(post_following)
    end
    # 自分自身の投稿を確認
    michael.microposts.each do |post_self| 
      assert michael.feed.include?(post_self)
    end
    # フォローしていないユーザの投稿が含まれていないことを確認
    archer.microposts.each do |post_unfollowed|
      assert_not michael.feed.include?(post_unfollowed)
    end
  end
end
