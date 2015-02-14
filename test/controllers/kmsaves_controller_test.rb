require 'test_helper'

class KmsavesControllerTest < ActionController::TestCase
  setup do
    @kmsafe = kmsaves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kmsaves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kmsafe" do
    assert_difference('Kmsave.count') do
      post :create, kmsafe: { data_h: @kmsafe.data_h, data_l: @kmsafe.data_l, disk_number: @kmsafe.disk_number, sector_id: @kmsafe.sector_id, sector_number_l: @kmsafe.sector_number_l }
    end

    assert_redirected_to kmsafe_path(assigns(:kmsafe))
  end

  test "should show kmsafe" do
    get :show, id: @kmsafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kmsafe
    assert_response :success
  end

  test "should update kmsafe" do
    patch :update, id: @kmsafe, kmsafe: { data_h: @kmsafe.data_h, data_l: @kmsafe.data_l, disk_number: @kmsafe.disk_number, sector_id: @kmsafe.sector_id, sector_number_l: @kmsafe.sector_number_l }
    assert_redirected_to kmsafe_path(assigns(:kmsafe))
  end

  test "should destroy kmsafe" do
    assert_difference('Kmsave.count', -1) do
      delete :destroy, id: @kmsafe
    end

    assert_redirected_to kmsaves_path
  end
end
