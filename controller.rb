require './dvc-sinatra.rb'
require 'pry'

# TODO: add your GET handlers here

get "/register" do
	halt erb(:register)
end

post "/register" do
	@register_title = "Register"
	user = User.new
	user.first_name = params[:first_name]
	user.last_name = params[:last_name]
	user.email = params[:email]
	user.password = params[:password]
	user.password_confirmation = params[:password_confirmation]
	if user.password != user.password_confirmation
		flash.now[:error] = "Passwords do not match."
		halt erb(:register)
	else
		user.save!
		redirect "/login"
	end
end

get "/admin/quiz-builder" do
	@categories = Category.order(:name).all
	halt erb(:quiz_builder)
end

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
	@title = "Admin"
	halt erb(:admin)
end

get '/admin/questions' do
	redirect "/admin/questions/new"
end

get '/admin/questions/:id' do
	if params[:id] != "new"
		edit_question = Question.find(params[:id])
		@category = edit_question.question_category
		@type = edit_question.question_type
		@text = edit_question.question_text
		@choice1 = edit_question.choice1
		@choice2 = edit_question.choice2
		@choice3 = edit_question.choice3
		@choice4 = edit_question.choice4
		@title = "Questions - Edit"
	else
		@category = ""
		@type = ""
		@text = ""
		@choice1 = ""
		@choice2 = ""
		@choice3 = ""
		@choice4 = ""
		@title = "Questions"
	end
	@questions = Question.order("id desc").all
	@types = Type.order(:name).all
	@categories = Category.order(:name).all
	halt erb(:questions)
end

post '/admin/questions/:id' do
	if params[:commit] == "Search"
	 	@questions = Question.where("question_text ilike ?", "%#{params[:criteria]}%").all
	 	@category = ""
		@type = ""
		@text = ""
		@choice1 = ""
		@choice2 = ""
		@choice3 = ""
		@choice4 = ""
	 	halt erb(:questions)
	end
	if params[:commit] == "Delete question"
		Question.destroy(params[:id])
		redirect '/admin/questions/new'
	end
	if params[:id] == "new"
		question = Question.new
	else
		question = Question.find(params[:id])
	end
	if params[:new_category] != ""
		category = Category.new
		category.name = params[:new_category]
		question.question_category = params[:new_category]
		category.save!
	else
		question.question_category = params[:category]
	end
	if params[:new_type] != ""
		type = Type.new
		type.name = params[:new_type]
		question.question_type 	= params[:new_type]
		type.save!
	else
		question.question_type 	= params[:type]
	end
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
	redirect "/admin/questions/new"
end

get '/admin/categories' do
	redirect "/admin/categories/new"
end

get '/admin/categories/:id' do
	if params[:id] != "new"
		edit_category = Category.find(params[:id])
		@name = edit_category.name
		@title = "Categories - Edit"
	else
		@edit_category_name = ""
		@title = "Categories"
	end
	@categories = Category.order("id desc").all
	halt erb(:categories)
end

post '/admin/categories/:id' do
	if params[:commit] == "Delete Category"
		Category.destroy(params[:id])
		redirect '/admin/categories/new'
	end
	if params[:id] == "new"
		category = Category.new
	else
		category = Category.find(params[:id])
	end
	category.name		= params[:name]
	category.save!

	redirect "/admin/categories/new"
end

get '/admin/types' do
	redirect "/admin/types/new"
end

get '/admin/types/:id' do
	if params[:id] != "new"
		edit_type = Type.find(params[:id])
		@name = edit_type.name
		@title = "Types - Edit"
	else
		@edit_type_name = ""
		@title = "Types"
	end
	@types = Type.order("id desc").all
	halt erb(:types)
end

post '/admin/types/:id' do
	if params[:commit] == "Delete Type"
		Type.destroy(params[:id])
		redirect '/admin/types/new'
	end
	if params[:id] == "new"
		type = Type.new
	else
		type = Type.find(params[:id])
	end
	type.name	= params[:name]
	type.save!
	redirect "/admin/types/new"
end