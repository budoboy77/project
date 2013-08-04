class CreateSchema < ActiveRecord::Migration
  def up
  	create_table :questions do |t|
      t.string :topic
      t.string :type
      t.text :question_text
	  	t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
	  	t.string :correct_answer
  	end
end

  def down
  	drop_table :questions
  end
end
