require 'test_helper'

class RpcRequestsControllerTest < ActionController::TestCase
  setup do
    @rpc_request = rpc_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rpc_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rpc_request" do
    assert_difference('RpcRequest.count') do
      post :create, :rpc_request => { :methodName => @rpc_request.methodName, :params => @rpc_request.params }
    end

    assert_redirected_to rpc_request_path(assigns(:rpc_request))
  end

  test "should show rpc_request" do
    get :show, :id => @rpc_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rpc_request
    assert_response :success
  end

  test "should update rpc_request" do
    put :update, :id => @rpc_request, :rpc_request => { :methodName => @rpc_request.methodName, :params => @rpc_request.params }
    assert_redirected_to rpc_request_path(assigns(:rpc_request))
  end

  test "should destroy rpc_request" do
    assert_difference('RpcRequest.count', -1) do
      delete :destroy, :id => @rpc_request
    end

    assert_redirected_to rpc_requests_path
  end
end
