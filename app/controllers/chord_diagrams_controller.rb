class ChordDiagramsController < ApplicationController
  before_action :set_chord_diagram, only: [:show, :edit, :update, :destroy]

  # GET /chord_diagrams
  # GET /chord_diagrams.json
  def index
    @chord_diagrams = ChordDiagram.all
  end

  # GET /chord_diagrams/1
  # GET /chord_diagrams/1.json
  def show
  end

  # GET /chord_diagrams/new
  def new
    @chord_diagram = ChordDiagram.new
  end

  # GET /chord_diagrams/1/edit
  def edit
  end

  # POST /chord_diagrams
  # POST /chord_diagrams.json
  def create
    @chord_diagram = ChordDiagram.new(chord_diagram_params)

    respond_to do |format|
      if @chord_diagram.save
        format.html { redirect_to @chord_diagram, notice: 'Chord diagram was successfully created.' }
        format.json { render :show, status: :created, location: @chord_diagram }
      else
        format.html { render :new }
        format.json { render json: @chord_diagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chord_diagrams/1
  # PATCH/PUT /chord_diagrams/1.json
  def update
    respond_to do |format|
      if @chord_diagram.update(chord_diagram_params)
        format.html { redirect_to @chord_diagram, notice: 'Chord diagram was successfully updated.' }
        format.json { render :show, status: :ok, location: @chord_diagram }
      else
        format.html { render :edit }
        format.json { render json: @chord_diagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chord_diagrams/1
  # DELETE /chord_diagrams/1.json
  def destroy
    @chord_diagram.destroy
    respond_to do |format|
      format.html { redirect_to chord_diagrams_url, notice: 'Chord diagram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chord_diagram
      @chord_diagram = ChordDiagram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chord_diagram_params
      params.require(:chord_diagram).permit(:name, :chords)
    end
end
