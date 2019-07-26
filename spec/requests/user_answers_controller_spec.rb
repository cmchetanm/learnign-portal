require 'rails_helper'

RSpec.describe UserAnswersController do
  describe 'POST#create' do
    it 'will create a user answer when correct answer' do
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
      answer = Answer.create(question: question, option: option2)
      expect{post user_answers_path(format: :json), params: {user_answer: {user_id: user.id, question_id: question.id, option_id: option2.id}}}.to change{UserAnswer.count}.by(1)
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["user_answer"]["answer"]).to be_truthy
    end

    it 'will create a user answer when incorrect answer' do
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
      answer = Answer.create(question: question, option: option2)
      expect{post user_answers_path(format: :json), params: {user_answer: {user_id: user.id, question_id: question.id, option_id: option3.id}}}.to change{UserAnswer.count}.by(1)
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["user_answer"]["answer"]).to be_falsy
    end
  end

  describe "GET#result" do
    it "return user percentage according to given answer" do
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
      answer = Answer.create(question: question, option: option2)
      get result_user_answers_path(user_id: user.id, format: :json)
      expect(JSON.parse(response.body)["result_details"][0]["subjects"][0]["topics"][0]["chapters"][0]["questions"]).to be_blank
      expect(JSON.parse(response.body)["result_details"][0]["subjects"][0]["topics"][0]["chapters"][0]["correct_answer"]).to eq(0)
      expect(JSON.parse(response.body)["result_details"][0]["subjects"][0]["topics"][0]["chapters"][0]["correct_answer_percentage"]).to eq(0)
      expect(JSON.parse(response.body)["result_details"].count).to eq(Exam.count)
    end
  end
end