class UserAnswersController < ApplicationController
  before_action :set_question, only: [:create]
  before_action :set_user, only: [:create, :result]
  before_action :set_option, only: [:create]
  before_action :user_answer_params, only: [:create]

  def create
    answer = Answer.find_by(question_id: @question.id)
    user = User.find_by(id: user_answer_params[:user_id])
    answer = answer.option_id == @option.id ? true : @option.title == "skip question" ? nil : false

    user_answer = UserAnswer.find_or_intialize_by(user: @user, question: @question) do |f|
      f.answer = answer
    end
    respond_to do |format|
      if user_answer.save
        format.json { render json: {user_answer: user_answer}, status: :ok }
      else
        format.json { render json: {error: user_answer.errors}, status: 422 }
      end
    end
  end

  def result
    respond_to do |format|
      format.json { render json: 
        {
          result_details: ActiveModel::Serializer::CollectionSerializer.new(Exam.all, serializer: ExamSerializer, user: @user )
        }, status: :ok
      }
    end    
  end

  private 

    def set_option
      @option = Option.find(user_answer_params[:option_id])
    end
    
    def set_question
      @question = Question.find(user_answer_params[:question_id])
    end

    def set_user
      @user = User.find( params[:user_id] || user_answer_params[:user_id])
    end
    
    def user_answer_params
      params.require(:user_answer).permit(:user_id, :question_id, :option_id)
    end
end
