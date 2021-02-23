require 'test_helper'

class SessionCorrectTest < ActionDispatch::IntegrationTest
 
  test 'unknown user cant go to index and should be redirected to login' do
    get index_input_url
    assert_redirected_to controller: :session, action: :login
  end

  test 'user with correct data should should be reditected to index' do
    user = User.create(username: "dimma", password: "11111", password_confirmation: "11111")
    post session_create_url, params: {username: user.username, password: "11111" }
    assert_redirected_to controller: :index, action: :input
  end

  test 'correct user should get correct info' do
    user = User.create(username: "dimma", password: "11111", password_confirmation: "11111")
    post session_create_url, params: {username: user.username, password: "11111" }
    get index_output_url, params:{input:'300'}
    assert_response :success
    assert_equal 300, assigns[:n]
  end

  test 'user can logout' do
    user = User.create(username: "dimma", password: "11111", password_confirmation: "11111")
    post session_create_url, params: {username: user.username, password: "11111" }
    get session_logout_url
    assert_redirected_to controller: :session, action: :login
  end

  test 'correct use can see users list' do
    user = User.create(username: "dimma", password: "11111", password_confirmation: "11111")
    post session_create_url, params: {username: user.username, password: "11111" }
    get users_url
    assert_response :success
  end

  test 'unknown user cant see users list' do
    get users_url
    assert_response :redirect
  end

  test 'create shouldnot work for invalid data' do
    user = User.create(username: "dimma2", password: "11111", password_confirmation: "11111")
    post session_create_url, params: {username: user.username, password: "11111" }
    assert_redirected_to controller: :session, action: :login
  end 
end

