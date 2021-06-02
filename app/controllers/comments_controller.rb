class CommentsController < ApplicationController
  before_action :find_commentable, only: [:create] #it's for the method find_commentable
  before_action :set_comment, except: [:create] #we only use the commentable inside of the create action, so for the other ones we wanna use set_comments, 
  before_action :authenticate_user!

  def create
    #commentable it's the parent so we make sons for this 
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if params[:comment_id]
      @comment.reply = true
    end
    @comment.save
  end

  def edit 
  end

  def update 
    if @comment.edit_history == ''
      #\n => replace \n with <br /><hr />
      @comment.edit_history = "Original:" + @content.body.body.to_plain_text + "\n"
    else 
      @comment.edit_history = @comment.edit_history + "Edit: " + params[:comment][:body] + "\n"
    end
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
  end

  def history
  end

  private 

  def comment_params 
    params.require(:comment).permit(:body)
  end

  def find_commentable
    #comment --> if the parent it's comment 
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
    elsif params[:post_id] 
      #post --> if it's a post 
      #we use Post.friendly_id because we put in the posts_controller that
      @commentable = Post.friendly.find(params[:post_id])

    end
  end

  def set_comment
    @coment = Coment.find(params[:id])
  end 
end
