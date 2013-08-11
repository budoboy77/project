class CreateNewSchema < ActiveRecord::Migration
  def up
  	create_table :questions do |t|
      t.string :question_category
      t.string :question_type
      t.text :question_text
	  	t.string :choice1
      t.string :choice2
      t.string :choice3
      t.string :choice4
	  	t.string :correct_answer
  	end
    create_table :categories do |t|
      t.string :name
    end
    create_table :types do |t|
      t.string :name
    end
end

  def down
  	drop_table :questions
    drop_table :categories
    drop_table :types
  end
end