class ChoicesController < ApplicationController
    before_action :authenticate_user!

    def new
        puts "testing"
        @test = Test.find(params[:test_id])
        @question = @test.questions.find(params[:question_id])
        @choice = @question.choices.build
        puts "#{@test}"
        puts "#{@question}"
        puts "#{@choice}"
    end

    def create
        @test = Test.find(params[:test_id])
        @question = Question.find(params[:question_id])
        @choice = @question.choices.create(choice_params)

        if @choice.save
            redirect_to @test
        end
    end

    private
    def choice_params
        params.require(:choice).permit(:choice)
    end 
end
