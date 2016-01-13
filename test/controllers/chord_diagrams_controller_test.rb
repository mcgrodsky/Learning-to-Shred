require 'test_helper'

class ChordDiagramsControllerTest < ActionController::TestCase
  setup do
    @chord_diagram = chord_diagrams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chord_diagrams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chord_diagram" do
    assert_difference('ChordDiagram.count') do
      post :create, chord_diagram: { chords: @chord_diagram.chords, name: @chord_diagram.name }
    end

    assert_redirected_to chord_diagram_path(assigns(:chord_diagram))
  end

  test "should show chord_diagram" do
    get :show, id: @chord_diagram
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chord_diagram
    assert_response :success
  end

  test "should update chord_diagram" do
    patch :update, id: @chord_diagram, chord_diagram: { chords: @chord_diagram.chords, name: @chord_diagram.name }
    assert_redirected_to chord_diagram_path(assigns(:chord_diagram))
  end

  test "should destroy chord_diagram" do
    assert_difference('ChordDiagram.count', -1) do
      delete :destroy, id: @chord_diagram
    end

    assert_redirected_to chord_diagrams_path
  end
end
