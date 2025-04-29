class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show update destroy ]

  # GET /authors
  def index
    @authors = Author.all

    render json: @authors
  end

  # GET /authors/1
  def show
    @author = Author.find(params[:id])
    render json: @author
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    @author = Author.find(params[:id])
    @author.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.expect(author: [ :name, :birth_year ])
    end
end
