require 'test_helper'

class StatementsControllerTest < ActionController::TestCase
  setup do
    @statement = statements(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:statements)
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statement" do
    assert_difference('Statement.count') do
      post :create, :statement => { :original => @statement.original }
    end

    assert_redirected_to statement_path(assigns(:statement))
  end

  test "should show statement" do
    get :show, :id => @statement
    assert_response :success
    assert_select '#original', @statement.original
    assert_select '#mysql_create_table_sql', /AUTO_INCREMENT/
    assert_select '#postgresql_create_table_sql', /SERIAL/
    assert_select '#sqlite3_create_table_sql', /AUTOINCREMENT/
  end

  # test "should get edit" do
  #   get :edit, :id => @statement
  #   assert_response :success
  # end

  # test "should update statement" do
  #   put :update, :id => @statement, :statement => { :original => @statement.original }
  #   assert_redirected_to statement_path(assigns(:statement))
  # end

  # test "should destroy statement" do
  #   assert_difference('Statement.count', -1) do
  #     delete :destroy, :id => @statement
  #   end

  #   assert_redirected_to statements_path
  # end
end
