require "application_system_test_case"

class CandidateDetailsTest < ApplicationSystemTestCase
  setup do
    @candidate_detail = candidate_details(:one)
  end

  test "visiting the index" do
    visit candidate_details_url
    assert_selector "h1", text: "Candidate Details"
  end

  test "creating a Candidate detail" do
    visit candidate_details_url
    click_on "New Candidate Detail"

    fill_in "Degree", with: @candidate_detail.degree
    fill_in "Email", with: @candidate_detail.email
    fill_in "Experience", with: @candidate_detail.experience
    fill_in "First", with: @candidate_detail.first
    fill_in "Last", with: @candidate_detail.last
    fill_in "Marks", with: @candidate_detail.marks
    fill_in "Phone", with: @candidate_detail.phone
    fill_in "Platform", with: @candidate_detail.platform
    click_on "Create Candidate detail"

    assert_text "Candidate detail was successfully created"
    click_on "Back"
  end

  test "updating a Candidate detail" do
    visit candidate_details_url
    click_on "Edit", match: :first

    fill_in "Degree", with: @candidate_detail.degree
    fill_in "Email", with: @candidate_detail.email
    fill_in "Experience", with: @candidate_detail.experience
    fill_in "First", with: @candidate_detail.first
    fill_in "Last", with: @candidate_detail.last
    fill_in "Marks", with: @candidate_detail.marks
    fill_in "Phone", with: @candidate_detail.phone
    fill_in "Platform", with: @candidate_detail.platform
    click_on "Update Candidate detail"

    assert_text "Candidate detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Candidate detail" do
    visit candidate_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Candidate detail was successfully destroyed"
  end
end
