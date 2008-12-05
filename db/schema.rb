# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081205014823) do

  create_table "countries", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string    "session_id",                    :null => false
    t.text      "data",       :limit => 1048576
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string    "email",            :limit => 50,                         :null => false
    t.string    "first_name",       :limit => 50,                         :null => false
    t.string    "middle_name",      :limit => 50
    t.string    "last_name",        :limit => 50,                         :null => false
    t.string    "country",          :limit => 50,                         :null => false
    t.string    "hashed_password",                                        :null => false
    t.string    "salt"
    t.string    "role",             :limit => 50,  :default => "generic", :null => false
    t.string    "type_user",                                              :null => false
    t.string    "email_2",          :limit => 50
    t.date      "date_of_birth"
    t.integer   "home_phone"
    t.integer   "work_phone"
    t.integer   "cell_phone"
    t.string    "job_title",        :limit => 50
    t.integer   "educational_inst"
    t.text      "about",            :limit => 400
    t.text      "interests",        :limit => 400
    t.text      "projects",         :limit => 400
    t.string    "keywords",         :limit => 60
    t.xml       "educational"
    t.xml       "job_experience"
    t.string    "picture"
    t.boolean   "newsletter"
    t.xml       "others_skills"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

end
