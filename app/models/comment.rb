class Comment < ApplicationRecord
  belongs_to :user

  before_create :set_comment_number

  #this is because we didn't add to the model the 'body' or 'content' of the comment
  has_rich_text :body

  #Polymorphic comments
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  def set_comment_number
    self.comment_number = user.comment_created  
  end
end
