require "test_helper"

class BadgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @badge = badges(:one)
  end

  test "should get index" do
    get badges_url
    assert_response :success
  end

  test "should get new" do
    get new_badge_url
    assert_response :success
  end

  test "should create badge" do
    assert_difference("Badge.count") do
      post badges_url, params: { badge: { category_id: @badge.category_id, description: @badge.description, image_url: @badge.image_url, name: @badge.name, price: @badge.price } }
    end

    assert_redirected_to badge_url(Badge.last)
  end

  test "should show badge" do
    get badge_url(@badge)
    assert_response :success
  end

  test "should get edit" do
    get edit_badge_url(@badge)
    assert_response :success
  end

  test "should update badge" do
    patch badge_url(@badge), params: { badge: { category_id: @badge.category_id, description: @badge.description, image_url: @badge.image_url, name: @badge.name, price: @badge.price } }
    assert_redirected_to badge_url(@badge)
  end

  test "should destroy badge" do
    assert_difference("Badge.count", -1) do
      delete badge_url(@badge)
    end

    assert_redirected_to badges_url
  end
end
