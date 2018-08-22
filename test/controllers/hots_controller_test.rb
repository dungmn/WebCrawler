require 'test_helper'

class HotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hot = hots(:one)
  end

  test "should get index" do
    get hots_url
    assert_response :success
  end

  test "should get new" do
    get new_hot_url
    assert_response :success
  end

  test "should create hot" do
    assert_difference('Hot.count') do
      post hots_url, params: { hot: { comment: @hot.comment, image_url: @hot.image_url, points: @hot.points, title: @hot.title } }
    end

    assert_redirected_to hot_url(Hot.last)
  end

  test "should show hot" do
    get hot_url(@hot)
    assert_response :success
  end

  test "should get edit" do
    get edit_hot_url(@hot)
    assert_response :success
  end

  test "should update hot" do
    patch hot_url(@hot), params: { hot: { comment: @hot.comment, image_url: @hot.image_url, points: @hot.points, title: @hot.title } }
    assert_redirected_to hot_url(@hot)
  end

  test "should destroy hot" do
    assert_difference('Hot.count', -1) do
      delete hot_url(@hot)
    end

    assert_redirected_to hots_url
  end
end
