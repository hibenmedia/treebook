require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "that /login route opens the log in page" do
  	get '/login'
  	assert_response :success
  end

  test "that /logout route opens the log out page" do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end

  test "that /register route opens the register page" do
  	get '/register'
  	assert_response :success
  end

  test "that a person's profile page works" do
    get '/jhipshir'
    assert_response :success
  end
end
