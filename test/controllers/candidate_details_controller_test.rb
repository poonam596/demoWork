require 'test_helper'

class CandidateDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidate_detail = candidate_details(:one)
  end

  test "should get index" do
    get candidate_details_url
    assert_response :success
  end

  test "should get new" do
    get new_candidate_detail_url
    assert_response :success
  end

  test "should create candidate_detail" do
    assert_difference('CandidateDetail.count') do
      post candidate_details_url, params: { candidate_detail: { degree: @candidate_detail.degree, email: @candidate_detail.email, experience: @candidate_detail.experience, first: @candidate_detail.first, last: @candidate_detail.last, marks: @candidate_detail.marks, phone: @candidate_detail.phone, platform: @candidate_detail.platform } }
    end

    assert_redirected_to candidate_detail_url(CandidateDetail.last)
  end

  test "should show candidate_detail" do
    get candidate_detail_url(@candidate_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_candidate_detail_url(@candidate_detail)
    assert_response :success
  end

  test "should update candidate_detail" do
    patch candidate_detail_url(@candidate_detail), params: { candidate_detail: { degree: @candidate_detail.degree, email: @candidate_detail.email, experience: @candidate_detail.experience, first: @candidate_detail.first, last: @candidate_detail.last, marks: @candidate_detail.marks, phone: @candidate_detail.phone, platform: @candidate_detail.platform } }
    assert_redirected_to candidate_detail_url(@candidate_detail)
  end

  test "should destroy candidate_detail" do
    assert_difference('CandidateDetail.count', -1) do
      delete candidate_detail_url(@candidate_detail)
    end

    assert_redirected_to candidate_details_url
  end
end
