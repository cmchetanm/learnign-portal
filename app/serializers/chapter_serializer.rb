class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :title, :questions, :correct_answer, :correct_answer_percentage, :wrong_answer, :skipped_question, :unseen_question

  def records
    object.questions.joins(:user_answers).where(user_answers: { user_id: @instance_options[:user].id } )
  end

  def questions
    records.map do |a|
      {
        question: a.title,
        user_answer: a.user_answers.find_by(user_id: @instance_options[:user].id).answer
      }
    end
  end

  def correct_answer
    records.where(user_answers: { answer: true } ).count
  end

  def correct_answer_percentage
    records.present? ? (correct_answer / records.count * 100) : 0
  end

  def wrong_answer
    records.where(user_answers: { answer: false } ).count
  end

  def skipped_question
    records.where(user_answers: { answer: nil } ).count
  end

  def unseen_question
    object.questions.count - records.count
  end

end
