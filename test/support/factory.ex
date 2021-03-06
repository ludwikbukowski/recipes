defmodule EmpexCookbook.Factory do
  use ExMachina.Ecto, repo: EmpexCookbook.Repo

  def user_factory do
    %EmpexCookbook.Accounts.User{
      email: "john@jacob.com",
      username: "john",
      password: "some password",
      bio: "some bio",
      image: "some image"
    }
  end

  def article_factory do
    %EmpexCookbook.Cookbook.Article{
      body: "some body",
      description: "some description",
      title: "some title",
      tag_list: ["tag1", "tag2"],
      slug: sequence(:slug, &"some-tile-#{&1}"),
      author: build(:user)
    }
  end

  def comment_factory do
    %EmpexCookbook.Cookbook.Comment{
      body: "some body",
      author: build(:user)
    }
  end

  def favorite_factory do
    %EmpexCookbook.Cookbook.Favorite{
      user: build(:user),
      article: build(:article)
    }
  end
end
