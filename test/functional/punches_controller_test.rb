require 'test_helper'

class PunchesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:punches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create punch" do
    assert_difference('Punch.count') do
      post :create, :punch => { }
    end

    assert_redirected_to punch_path(assigns(:punch))
  end

  test "should show punch" do
    get :show, :id => punches(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => punches(:one).to_param
    assert_response :success
  end

  test "should update punch" do
    put :update, :id => punches(:one).to_param, :punch => { }
    assert_redirected_to punch_path(assigns(:punch))
  end

  test "should destroy punch" do
    assert_difference('Punch.count', -1) do
      delete :destroy, :id => punches(:one).to_param
    end

    assert_redirected_to punches_path
  end
end
