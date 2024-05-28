class QuestionsController < ApplicationController
    before_action :authenticate_user!

    def new
        @question = Question.new
    end

    def create
        @test = Test.find(params[:test_id])
        @question = @test.questions.create(question_params)

        if @question.save
            redirect_to @test
        end
    end

    private
    def question_params
        params.require(:question).permit(:question, :answer)
    end
end
