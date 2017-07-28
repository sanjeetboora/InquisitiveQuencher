class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable,:recoverable, :rememberable, :trackable, :validatable
has_many :questions
has_many :answers
def feed
  	Question.includes(:user).where(user_id: users).order(created_at: :desc)
end
end
