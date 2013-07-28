class CreateSchema < ActiveRecord::Migration
  def up
  	create_table :questions do |t|
	  	t.string :category
	  	t.string :answer
	  	t.text :explaination
  	end
  	create_table :categories do |t|
  		t.string :category_name
  	end

  	create_table :users do |t|
  		t.string :user_name
  		t.string :email
  		t.string :role
  		t.string :last_questionnaire
  	end
end

  def down
  	drop_table :questions
  	drop_table :categories
  	drop_table :users
  end
end
