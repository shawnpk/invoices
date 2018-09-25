require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get about" do
    get welcome_about_url
    assert_response :success
  end

  test "should get contact" do
    get welcome_contact_url
    assert_response :success
  end

  test "should get faq" do
    get welcome_faq_url
    assert_response :success
  end

  test "should get pricing" do
    get welcome_pricing_url
    assert_response :success
  end

  test "should get features" do
    get welcome_features_url
    assert_response :success
  end

end
