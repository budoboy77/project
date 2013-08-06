require './dvc-sinatra.rb'

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
	@questions = Question.all
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