require './dvc-sinatra.rb'
require 'pry'

# TODO: add your GET handlers here

get '/quiz' do
	@title = "quiz"
	
	halt erb(:quiz)
end

get '/helppage' do
	@title = "help"
	halt erb(:help)
end

get '/clicked' do
	halt erb(:clickedbutton)
end

get '/admin' do
	@title = "admin"
	halt erb(:admin)
end

get '/questions' do
	@title = "Questions"
	@questions = Question.order("id desc").all
	halt erb(:questions)
end

post '/questions' do
	new_question = Question.new
	new_question.question_topic = params[:topic]
	new_question.question_type 	= params[:type]
	new_question.question_text 	= params[:text]
	new_question.choice1		= params[:choice1]
	new_question.choice2		= params[:choice2]
	new_question.choice3		= params[:choice3]
	new_question.choice4		= params[:choice4]
	if params[:answer1] != nil
		new_question.correct_answer	= params[:choice1]
	elsif params[:answer2] != nil
		new_question.correct_answer	= params[:choice2]
	elsif params[:answer3] != nil
		new_question.correct_answer	= params[:choice3]
	else params[:answer4] != nil
		new_question.correct_answer	= params[:choice4]
	end
	new_question.save!
	redirect "/questions"
end

get "/questions/edit/:id" do
	@question = Question.find(params[:id])
	halt erb(:edit_question)
end

post "/questions/edit/:id" do
	question = Question.find(params[:id])
	question.question_topic = params[:topic]
	question.question_type 	= params[:type]
	question.question_text 	= params[:text]
	question.choice1		= params[:choice1]
	question.choice2		= params[:choice2]
	question.choice3		= params[:choice3]
	question.choice4		= params[:choice4]
	if params[:answer1] != nil
		question.correct_answer	= params[:choice1]
	elsif params[:answer2] != nil
		question.correct_answer	= params[:choice2]
	elsif params[:answer3] != nil
		question.correct_answer	= params[:choice3]
	else params[:answer4] != nil
		question.correct_answer	= params[:choice4]
	end
	question.save!
	redirect "/questions"
end