require 'test_helper'

class ArticleDeleteTest < ActionDispatch::IntegrationTest
  def setup
		@user = User.create!(username: "Craig", email: "craig@example.com", password: "password")
		@article = Article.create!(title: "my title", description: "my description", user: @user)
	end

	test "should delete article ok" do
		get article_path(@article)
		assert_select 'a[href=?]', article_path(@article), text: "Delete this Article"
		# Check if the count decreases on successful delete
		assert_difference 'Article.count', -1 do
			delete article_path(@article)
		end
		# Should flash a success message
		assert_not flash.empty?
	end
end
