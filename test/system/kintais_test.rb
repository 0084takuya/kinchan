require "application_system_test_case"

class KintaisTest < ApplicationSystemTestCase
  setup do
    @kintai = kintais(:one)
  end

  test "visiting the index" do
    visit kintais_url
    assert_selector "h1", text: "Kintais"
  end

  test "creating a Kintai" do
    visit kintais_url
    click_on "New Kintai"

    fill_in "End", with: @kintai.end
    fill_in "Start", with: @kintai.start
    fill_in "User", with: @kintai.user_id
    click_on "Create Kintai"

    assert_text "Kintai was successfully created"
    click_on "Back"
  end

  test "updating a Kintai" do
    visit kintais_url
    click_on "Edit", match: :first

    fill_in "End", with: @kintai.end
    fill_in "Start", with: @kintai.start
    fill_in "User", with: @kintai.user_id
    click_on "Update Kintai"

    assert_text "Kintai was successfully updated"
    click_on "Back"
  end

  test "destroying a Kintai" do
    visit kintais_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kintai was successfully destroyed"
  end
end
