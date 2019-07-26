require 'rails_helper'

RSpec.describe QuestionsController do
  describe 'GET#index' do

    it 'returns questions which does not answered by user yet' do
      user = create(:user)
      exam = create(:exam, title: "Terminal")
      subject = create(:subject, title: "Maths", exam: exam)
      topic = create(:topic, title: "Trignometry", subject: subject)
      chapter = create(:chapter, title: "chapter1", topic: topic)
      question = create(:question, title: "A man presses more weight on earth at", chapter: chapter, level: 0)
      option1 = create(:option, title: "Sitting position", question: question)
      option2 = create(:option, title: "Standing Position", question: question)
      option3 = create(:option, title: "Lying Position", question: question)
      option4 = create(:option, title: "None of these", question: question)
      get questions_path(user_id: user.id, format: :json)
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["questions"][0]["title"]).to eq(exam.title)
    end
  end

end
