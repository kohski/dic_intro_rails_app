class BlogsController < ApplicationController
  before_action :set_blog, only:[:show,:edit,:update,:destroy]


  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to new_blog_path, notice:"complete!"      
    else
      render 'new'
    end
  end

  def show
  end
  
  def confirm
    @blog = Blog.new(blog_params)
  end
  
  
  def edit
  end
  
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "edit complete!"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path,notice:"delete complete!"
  end
  
  private
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
    
  def blog_params
    params.require(:blog).permit(:title,:content)
  end
  
end
