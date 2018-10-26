class User < ActiveRecord::Base
  attr_writer :login

  def login
    @login || self.username || self.email
  end
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable,
         authentication_keys: [:login]

  #to add case insensitivity to your validations on :username
  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  def self.find_first_by_auth_conditions(warden_conditions)

    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end


  #   # #f you want email to be case insensitive, you should add
  #   # conditions[:email].downcase! if conditions[:email]
  #   # where(conditions.to_hash).first
  # end


end
