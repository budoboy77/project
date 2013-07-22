require 'sinatra'

# TODO: add your GET handlers here

get '/questionnaire' do
	halt erb(:question)
end

get '/helppage' do
	halt erb(:help)
end

get '/clicked' do
	halt erb(:clickedbutton)
end