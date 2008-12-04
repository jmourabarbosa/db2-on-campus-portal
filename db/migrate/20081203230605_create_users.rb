class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email,              :null => false, :limit => 50
      t.string :first_name,         :null => false, :limit => 50
      t.string :middle_name,                        :limit => 50                         
      t.string :last_name,          :null => false, :limit => 50
      t.string :country,            :null => false, :limit => 50
      t.string :hashed_password,    :null => false 
      t.string :salt               
      t.string :role,              :default => 'generic', :null => false, :limit => 50 
      t.string :type_user,          :null => false
      t.string :email_2,            :limit => 50            
      t.date :date_of_birth
      t.integer :home_phone
      t.integer :work_phone
      t.integer :cell_phone
      t.string :job_title,          :limit => 50
      t.integer :educational_inst
      t.text :about,               :limit => 400
      t.text :interests,           :limit => 400
      t.text :projects,            :limit => 400
      t.string :keywords,          :limit => 60
      t.xml :educational
      t.xml :job_experience
      t.string :picture
      t.boolean :newsletter
      t.xml :others_skills

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
