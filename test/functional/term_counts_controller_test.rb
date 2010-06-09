require 'test_helper'

class TermCountsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:term_counts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create term_count" do
    assert_difference('TermCount.count') do
      post :create, :term_count => { }
    end

    assert_redirected_to term_count_path(assigns(:term_count))
  end

  test "should show term_count" do
    get :show, :id => term_counts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => term_counts(:one).to_param
    assert_response :success
  end

  test "should update term_count" do
    put :update, :id => term_counts(:one).to_param, :term_count => { }
    assert_redirected_to term_count_path(assigns(:term_count))
  end

  test "should destroy term_count" do
    assert_difference('TermCount.count', -1) do
      delete :destroy, :id => term_counts(:one).to_param
    end

    assert_redirected_to term_counts_path
  end
end
