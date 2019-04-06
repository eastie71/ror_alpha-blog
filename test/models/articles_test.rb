require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
	def setup
		@user = User.create!(username: "Craig", email: "craig@example.com", password: "password")
		@article = Article.create!(title: "my title", description: "my description", user: @user)
	end

	test "article without user should be invalid" do
		@article.user_id = nil
		assert_not @article.valid?
	end

	test "article should be valid" do
		assert @article.valid?
	end

	test "article title cannot be blank" do
		@article.title = ""
		assert_not @article.valid?
	end

	test "article title cannot be too short" do
		@article.title = "A"
		assert_not @article.valid?
	end

	test "article description cannot be empty" do
		@article.description = ""
		assert_not @article.valid?
	end

	test "article description cannot be too short" do
		@article.description = "ABC"
		assert_not @article.valid?
	end
end
