require 'test_helper'

class KintaisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kintai = kintais(:one)
  end

  test "should get index" do
    get kintais_url
    assert_response :success
  end

  test "should get new" do
    get new_kintai_url
    assert_response :success
  end

  test "should create kintai" do
    assert_difference('Kintai.count') do
      post kintais_url, params: { kintai: { end: @kintai.end, start: @kintai.start, user_id: @kintai.user_id } }
    end

    assert_redirected_to kintai_url(Kintai.last)
  end

  test "should show kintai" do
    get kintai_url(@kintai)
    assert_response :success
  end

  test "should get edit" do
    get edit_kintai_url(@kintai)
    assert_response :success
  end

  test "should update kintai" do
    patch kintai_url(@kintai), params: { kintai: { end: @kintai.end, start: @kintai.start, user_id: @kintai.user_id } }
    assert_redirected_to kintai_url(@kintai)
  end

  test "should destroy kintai" do
    assert_difference('Kintai.count', -1) do
      delete kintai_url(@kintai)
    end

    assert_redirected_to kintais_url
  end
end
