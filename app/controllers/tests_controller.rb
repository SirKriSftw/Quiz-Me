class TestsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        @tests = Test.all
    end

    def show
        @test = Test.find(params[:id])
        @questions = @test.questions
    end

    def new
        @test = Test.new
    end

    def create
        @user = current_user
        @test = @user.created_tests.build(test_params)

        if @test.save
            redirect_to @test
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @test = Test.find(params[:id])
    end

    def update
        @test = Test.find(params[:id])
        if @test.update(test_params)
            redirect_to @test
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @test = Test.find(params[:id])
        @test.destroy
        redirect_to root_path, status: :see_other
    end


    private
    def test_params
        params.require(:test).permit(:name, :description)
    end
end
