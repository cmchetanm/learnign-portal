class QuestionsController < ApplicationController
 before_action :set_user, only: [:index]

  def index
    question_ids = @user.user_answers.where.not(answer: nil).pluck(:question_id)
    questions = Question.where.not(id: question_ids).order("RANDOM()")
    
    respond_to do |format|
      format.json { render json: 
        {
          questions: ActiveModel::Serializer::CollectionSerializer.new(Exam.all, serializer: QuestionSerializer, questions: questions)
        }, status: :ok
      }
    end
  end

  private 
    def set_user
      @user = User.find(params[:user_id])
    end
end
