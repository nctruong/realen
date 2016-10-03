class SentencesController < ApplicationController
  before_action :set_sentence, only: [:show, :edit, :update, :destroy]
  before_action :set_section
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render 'notfound' # Assuming you have a template named 'record_not_found'
  end
  # GET /sentences
  # GET /sentences.json
  def index
    @sentences = @section.sentences unless @section.nil?
  end

  # GET /sentences/1
  # GET /sentences/1.json
  def show
  end

  # GET /sentences/new
  def new
    @sentence = Sentence.new
  end

  # GET /sentences/1/edit
  def edit
  end

  # POST /sentences
  # POST /sentences.json
  def create
    @sentence = Sentence.new(sentence_params)
    @sentence.section_id = @section.id
    #respond_to do |format|
    if @sentence.save
      flash[:success] = "\'#{@sentence.content}\' was saved successfully"
    else
      flash[:warning] = "\'#{@sentence.content}\' could not be saved"
    end
    redirect_to section_sentences_path
    #end
  end

  # PATCH/PUT /sentences/1
  # PATCH/PUT /sentences/1.json
  def update
    respond_to do |format|
      if @sentence.update(sentence_params)
        format.html { redirect_to @sentence, notice: 'Sentence was successfully updated.' }
        format.json { render :show, status: :ok, location: @sentence }
      else
        format.html { render :edit }
        format.json { render json: @sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sentences/1
  # DELETE /sentences/1.json
  def destroy
    @sentence.destroy
    respond_to do |format|
      format.html { redirect_to [@section,@sentence], notice: 'Sentence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentence
      @sentence = Sentence.find(params[:id])
    end

    def set_section
      @section = Section.find(params[:section_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def sentence_params
      params.require(:sentence).permit(:section_id, :content, :comment, :audio)
    end
end
