class Post < ApplicationRecord
  belongs_to :user

  #comments 
  has_many :comments, as: :commentable, dependent: :destroy

  #Active storage from rails 5
  has_one_attached :image
  has_one_attached :photo
  #has_many_attached :... --> por si quiero varias imagenes, en este caso solo quiero dos 

  #Action text from rails 6
  has_rich_text :body

  #Validations on this body:
  validates :title, length: {minimum: 5}
  validates :body, length: {minimum: 25}

  #pagination
  self.per_page = 10
  
  #friendly_id
  extend FriendlyId
  friendly_id :title, use: :slugged  

  #for the size of the img(i can do with css but also in this way)
  def optimize_image(image, x, y)
    return image.variant(resize_to_fill: [x,y]).processed  
  end
end
