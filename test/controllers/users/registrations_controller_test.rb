require 'test_helper'

class Users::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_registration_create_url
    assert_response :success
  end

end
