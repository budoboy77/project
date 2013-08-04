class CreateQuestionsTable < ActiveRecord::Migration
  def up
  	create_table :questions do |t|
      t.string :question_topic
      t.string :question_type
      t.text :question_text
	  	t.string :choice1
      t.string :choice2
      t.string :choice3
      t.string :choice4
	  	t.string :correct_answer
  	end
end

  def down
  	drop_table :questions
  end
end