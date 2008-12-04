require 'digest/sha1'

class User < ActiveRecord::Base

  #has_one :country
  validates_presence_of     :email, :type_user, :country, :first_name, :last_name
  
  validates_length_of       :email, :within => 3..50
  validates_length_of       :first_name, :last_name, :country, :maximum => 50
  validates_length_of       :password, :minimum => 8
   
  validates_uniqueness_of   :email, :case_sensitive => false
  
  validates_format_of       :email,
                            :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  validate :password_non_blank 

  validate :different_user

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
	 user = nil
      end
    end
    user
  end	

  # 'password' is a virtual attribute
  def password
    @password
  end 

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

 private

  def password_non_blank
    errors.add_to_base("Missing password") if hashed_password.blank?
  end

  def different_user
    errors.add_to_base("Same user with different ID") if User.exists?(:first_name => self.first_name, :last_name => self.last_name, :country => self.country)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
end
