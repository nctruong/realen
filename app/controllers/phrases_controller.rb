class PhrasesController < ApplicationController
  before_action :set_phrase, only: [:show, :edit, :update, :destroy]
  before_action :set_sentence
  # GET /phrases
  # GET /phrases.json
  def index
    @phrases = @sentence.phrases
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
  end

  # GET /phrases/new
  def new
    @phrase = Phrase.new
  end

  # GET /phrases/1/edit
  def edit
  end

  # POST /phrases
  # POST /phrases.json
  def create
    @phrase = Phrase.new(phrase_params)
    @phrase.sentence_id = @sentence.id
    if @phrase.save
      flash[:success] = "\'#{@phrase.content}\' was saved successfully"
    else
      flash[:warning] = "\'#{@phrase.content}\' could not be saved"
    end
    redirect_to sentence_phrases_path
  end

  # PATCH/PUT /phrases/1
  # PATCH/PUT /phrases/1.json
  def update

    if @phrase.update(phrase_params)
      flash[:success] = "\'#{@phrase.content}\' was saved successfully"
    else
      flash[:warning] = "\'#{@phrase.content}\' could not be saved"
    end
    redirect_to sentence_phrases_path
  end

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    @phrase.destroy
    respond_to do |format|
      format.html { redirect_to phrases_url, notice: 'Phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase
      @phrase = Phrase.find(params[:id])
    end

    def set_sentence
      @sentence = Sentence.find(params[:sentence_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def phrase_params
      params.require(:phrase).permit(:sentence_id, :content, :comment, :audio, :phonetic_symbols)
    end
end
