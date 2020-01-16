require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:customer)
    @user.password = 'password'
    @user.save
    @feedback = feedbacks(:one)
    @feedback.user_id = @user.id

    post login_path, params: { email: @user.email, password: 'password' }
  end

  test "should get index" do
    get feedbacks_url
    assert_response :success
  end

  test "should get new" do
    get new_feedback_url
    assert_response :success
  end

  test "should create feedback" do
    assert_difference('Feedback.count') do
      post feedbacks_url, params: { feedback: { description: @feedback.description, title: @feedback.title } }
    end

    assert_redirected_to feedback_url(Feedback.last)
  end

  test "should show feedback" do
    @feedback.save
    get feedback_url(@feedback)
    assert_response :success
  end
end
