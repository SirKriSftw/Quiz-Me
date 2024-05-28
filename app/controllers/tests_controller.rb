class TestsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        @tests = Test.all
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


    private
    def test_params
        params.require(:test).permit(:name, :description)
    end
end
