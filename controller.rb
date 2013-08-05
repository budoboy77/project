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