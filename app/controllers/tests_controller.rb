class TestsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
    
    def index
    end
  
    def new
      @test = Test.new
    end
  
    def show
      @test = Test.find_by(id: params[:id])
    end
  
    def create
      @test = Test.new(test_params)
      params[:test][:question] ? @test.question = params[:test][:question].join("") : false
      if @test.save
          flash[:notice] = "診断が完了しました"
          redirect_to test_path(@test.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def test_params
        params.require(:test).permit(:id, question: [])
    end
end
