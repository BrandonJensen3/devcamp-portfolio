class PagesController < ApplicationController
  def home
  end
    @posts = Blog.all
    @skills = Skill.all
  def about
  end

  def contact
  end
end
