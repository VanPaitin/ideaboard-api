module Api
  class IdeasController < ApplicationController
    def index
      @ideas = Idea.order(created_at: :desc)

      render json: @ideas
    end

    def create
      @idea = Idea.new(idea_params)
      if @idea.save
        render json: @idea, status: 201
      else
        render json: @idea.errors, status: 422
      end
    end

    def update
      @idea = Idea.find(params[:id])

      if @idea.update(idea_params)
        render json: @idea, status: 200
      else
        render json: @idea.errors, status: 422
      end
    end

    def destroy
      Idea.destroy(params[:id])

      head 200
    end

    private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
  end
end
