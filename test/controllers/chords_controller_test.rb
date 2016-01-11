require 'test_helper'

class ChordsControllerTest < ActionController::TestCase
  setup do
    @chord = chords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chord" do
    assert_difference('Chord.count') do
      post :create, chord: { title: @chord.title, user_id: @chord.user_id }
    end

    assert_redirected_to chord_path(assigns(:chord))
  end

  test "should show chord" do
    get :show, id: @chord
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chord
    assert_response :success
  end

  test "should update chord" do
    patch :update, id: @chord, chord: { title: @chord.title, user_id: @chord.user_id }
    assert_redirected_to chord_path(assigns(:chord))
  end

  test "should destroy chord" do
    assert_difference('Chord.count', -1) do
      delete :destroy, id: @chord
    end

    assert_redirected_to chords_path
  end
end
