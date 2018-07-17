class User < ApplicationRecord
  rolify
  
  after_create :assign_default_role
  
  def assign_default_role
    add_role(:student)
  end
  
  has_many :articles
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
