class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_one_attached :avatar

    #gaby@example.com -> self.email.split('@') -> ['gaby', 'example.com'] -> [0] -> 'gaby'.capitalize -> Gaby  
  def username 
    return email.split("@")[0].capitalize
  end

  def comment_created
    #this is the same thing as: num_comments += 1
    self.number_of_comments = number_of_comments + 1
    save
    number_of_comments #If I want, I can write 'return' 
  end
end
