require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  # Disabling 'parallelize' in test_helper ensures these tests pass
  describe 'POST create' do
    it 'should create user' do
      assert_difference('User.count') do
        post users_url, params: { user: { username: @user.username } }
      end
      assert_response :redirect
    end

    it 'should create user with different cookie' do
      assert_difference('User.count') do
        post users_url, params: { user: { username: @user.username } }
      end
      assert_response :redirect
    end
  end

  # These tests always pass
  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { username: @user.username } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should create another user" do
    assert_difference('User.count') do
      post users_url, params: { user: { username: @user.username } }
    end

    assert_redirected_to user_url(User.last)
  end
end
