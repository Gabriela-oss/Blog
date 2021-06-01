class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    #gaby@example.com -> self.email.split('@') -> ['gaby', 'example.com'] -> [0] -> 'gaby'.capitalize -> Gaby  
  def username 
    return email.split("@")[0].capitalize
  end
end
