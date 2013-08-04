require 'sinatra'

# TODO: add your GET handlers here

get '/questionnaire' do
	@title = "questionnaire"
	halt erb(:questionnaire)
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
	halt erb(:questions)
end