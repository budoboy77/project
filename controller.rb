require 'sinatra'

# TODO: add your GET handlers here

get '/questionnaire' do
	erb(:question)
end