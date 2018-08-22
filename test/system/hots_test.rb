require "application_system_test_case"

class HotsTest < ApplicationSystemTestCase
  setup do
    @hot = hots(:one)
  end

  test "visiting the index" do
    visit hots_url
    assert_selector "h1", text: "Hots"
  end

  test "creating a Hot" do
    visit hots_url
    click_on "New Hot"

    fill_in "Comment", with: @hot.comment
    fill_in "Image Url", with: @hot.image_url
    fill_in "Points", with: @hot.points
    fill_in "Title", with: @hot.title
    click_on "Create Hot"

    assert_text "Hot was successfully created"
    click_on "Back"
  end

  test "updating a Hot" do
    visit hots_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @hot.comment
    fill_in "Image Url", with: @hot.image_url
    fill_in "Points", with: @hot.points
    fill_in "Title", with: @hot.title
    click_on "Update Hot"

    assert_text "Hot was successfully updated"
    click_on "Back"
  end

  test "destroying a Hot" do
    visit hots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hot was successfully destroyed"
  end
end
