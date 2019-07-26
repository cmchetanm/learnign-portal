# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


exam1 = Exam.create(title: "Terminal")
exam2 = Exam.create(title: "Half")
exam3 = Exam.create(title: "Yearly")


subject1 = Subject.create(title: "Maths", exam: exam1)
subject2 = Subject.create(title: "Physics", exam: exam2)
subject3 = Subject.create(title: "Chemistry", exam: exam3)

topic1 = Topic.create(title: "Trignometry", subject: subject1)
topic2 = Topic.create(title: "Thermodynamics", subject: subject2)
topic3 = Topic.create(title: "Organic", subject: subject3)

chapter1 = Chapter.create(title: "chapter1", topic: topic1)
chapter2 = Chapter.create(title: "chapter2", topic: topic2)
chapter3 = Chapter.create(title: "chapter3", topic: topic3)

question1 = Question.create(title: "A man presses more weight on earth at", chapter: chapter1, level: 0)
option1 = Option.create(title: "Sitting position", question: question1)
option2 = Option.create(title: "Standing Position", question: question1)
option3 = Option.create(title: "Lying Position", question: question1)
option4 = Option.create(title: "None of these", question: question1)
option5 = Option.create(title: "skip question", question: question1)
answer1 = Answer.create(question: question1, option: option2)

question2 = Question.create(title: "A piece of ice is dropped in a vesel containing kerosene. When ice melts, the level of kerosene will", chapter: chapter1, level: 1)
option6 = Option.create(title: "Rise", question: question2)
option7 = Option.create(title: "Fall", question: question2)
option8 = Option.create(title: "Remain Same", question: question2)
option9 = Option.create(title: "None of these", question: question2)
option10 = Option.create(title: "skip question", question: question2)
answer2 = Answer.create(question: question2, option: option8)

question3 = Question.create(title: "Young's modulus is the property of", chapter: chapter1, level: 1)
option11 = Option.create(title: "Gas only", question: question3)
option12 = Option.create(title: "Both Solid and Liquid", question: question3)
option13 = Option.create(title: "Liquid only", question: question3)
option14 = Option.create(title: "Solid only", question: question3)
option15 = Option.create(title: "skip question", question: question3)
answer3 = Answer.create(question: question3, option: option11)


question4 = Question.create(title: "An artificial Satellite revolves round the Earth in circular orbit, which quantity remains constant?", chapter: chapter1, level: 2)
option16 = Option.create(title: "Angular Momentum", question: question4)
option17 = Option.create(title: "Angular Displacement", question: question4)
option18 = Option.create(title: "Remain Same", question: question4)
option19 = Option.create(title: "None of these", question: question4)
option20 = Option.create(title: "skip question", question: question4)
answer4 = Answer.create(question: question4, option: option19)


question5 = Question.create(title: "What is the scale used for measuring the intensity of the earthquake?", chapter: chapter2, level: 2)
option21 = Option.create(title: "Metric Scale", question: question5)
option22 = Option.create(title: "Quake Scale", question: question5)
option23 = Option.create(title: "Richter Scale", question: question5)
option24 = Option.create(title: "Epicentre Scale", question: question5)
option25 = Option.create(title: "skip question", question: question5)
answer5 = Answer.create(question: question5, option: option22)

question6 = Question.create(title: "A jet engine works on the principle of conservation of", chapter: chapter2, level: 2)
option26 = Option.create(title: "Linear momentum", question: question6)
option27 = Option.create(title: "Angular momentum", question: question6)
option28 = Option.create(title: "Energy Mass", question: question6)
option29 = Option.create(title: "Mass Velocity", question: question6)
option30 = Option.create(title: "skip question", question: question6)
answer6 = Answer.create(question: question6, option: option27)

question7 = Question.create(title: "  Bolometer is used to measure", chapter: chapter2, level: 2)
option31 = Option.create(title: "Frequency", question: question7)
option32 = Option.create(title: "Temperature", question: question7)
option33 = Option.create(title: "Velocity", question: question7)
option34 = Option.create(title: "Wavelength", question: question7)
option35 = Option.create(title: "skip question", question: question7)
answer7 = Answer.create(question: question7, option: option34)

question8 = Question.create(title: "An artificial Satellite revolves round the Earth in circular orbit, which quantity remains constant?", chapter: chapter2, level: 2)
option36 = Option.create(title: "Angular Momentum", question: question8)
option37 = Option.create(title: "Angular Displacement", question: question8)
option38 = Option.create(title: "Remain Same", question: question8)
option39 = Option.create(title: "None of these", question: question8)
option40 = Option.create(title: "skip question", question: question8)
answer8 = Answer.create(question: question8, option: option36)


question9 = Question.create(title: "Which one of the following is not used to dope a semiconductor ?", chapter: chapter3, level: 2)
option41 = Option.create(title: "Al", question: question9)
option42 = Option.create(title: "B", question: question9)
option43 = Option.create(title: "In", question: question9)
option44 = Option.create(title: "Au", question: question9)
option45 = Option.create(title: "skip question", question: question9)
answer9 = Answer.create(question: question9, option: option43)

question10 = Question.create(title: "The macro-nutrient provided by inorganic fertilization are", chapter: chapter3, level: 2)
option46 = Option.create(title: "C, Fe, B", question: question10)
option47 = Option.create(title: "C, N, P", question: question10)
option48 = Option.create(title: "N, P, K", question: question10)
option49 = Option.create(title: "Mg, Zn, Fe", question: question10)
option50 = Option.create(title: "skip question", question: question10)
answer10 = Answer.create(question: question10, option: option46)

question11 = Question.create(title: "When TEL (Tera Ethyl Lead) is added to petrol ", chapter: chapter3, level: 2)
option51 = Option.create(title: "It increases the B.P of petrol", question: question11)
option52 = Option.create(title: "Increases the aniti-knocking rating", question: question11)
option53 = Option.create(title: "Decreases the B.P of petrol", question: question11)
option54 = Option.create(title: "Decreased the ani-kncking rating", question: question11)
option55 = Option.create(title: "skip question", question: question11)
answer11 = Answer.create(question: question11, option: option54)

question12 = Question.create(title: "Which of the Carbon Compounds is used as fire extinguisher ?", chapter: chapter3, level: 2)
option56 = Option.create(title: "CS<sub>2</sub>", question: question12)
option57 = Option.create(title: "CHCl<sub>3</sub>", question: question12)
option58 = Option.create(title: "CH<sub>3</sub>Cl", question: question12)
option59 = Option.create(title: "CCl<sub>4</sub> ", question: question12)
option60 = Option.create(title: "skip question", question: question12)
answer12 = Answer.create(question: question12, option: option59)

user1 = User.create(first_name: "bob", last_name: "marle", email: "bob.marle@yopmail.com")
user2 = User.create(first_name: "john", last_name: "wick", email: "john.wick@yopmail.com")

