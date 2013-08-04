# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130804215430) do

  create_table "questions", :force => true do |t|
    t.string "question_topic"
    t.string "question_type"
    t.text   "question_text"
    t.string "choice1"
    t.string "choice2"
    t.string "choice3"
    t.string "choice4"
    t.string "correct_answer"
  end

end
