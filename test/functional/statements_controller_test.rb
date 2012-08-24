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

  test "should show statement as HTML" do
    get :show, :id => @statement
    assert_response :success
    assert_select '#original', @statement.original
    assert_select '#mysql_create_table_sql', /AUTO_INCREMENT/
    assert_select '#postgresql_create_table_sql', /SERIAL/
    assert_select '#sqlite3_create_table_sql', /AUTOINCREMENT/
    @statement.columns.each do |c|
      assert_select "tr#column_#{c.name}" do
        assert_select 'td.name', c.name
        assert_select 'td.data_type', c.data_type
        assert_select 'td.allow_null', c.allow_null.to_s
        assert_select 'td.default', c.default.to_s
        assert_select 'td.primary_key', c.primary_key.to_s
        assert_select 'td.unique', c.unique.to_s
        assert_select 'td.autoincrement', c.autoincrement.to_s
        assert_select 'td.charset', c.charset.to_s
        assert_select 'td.collate', c.collate.to_s
      end
    end
  end

  test "should show statement as JSON" do
    get :show, :id => @statement, :format => :json
    assert_response :success
    s = MultiJson.load(response.body)['statement']
    assert_equal s['original'], @statement.original
    assert_match /AUTO_INCREMENT/, s['mysql']
    assert_match /SERIAL/, s['postgresql']
    assert_match /AUTOINCREMENT/, s['sqlite3']
  end

  test "should show statement as MySQL-compatible SQL" do
    get :show, :id => @statement, :format => :mysql_sql
    assert_response :success
    assert_equal @statement.mysql, response.body
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
