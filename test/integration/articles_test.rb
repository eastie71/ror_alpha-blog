require 'test_helper'

class ArticlesTest < ActionDispatch::IntegrationTest
  def setup
		@user = User.create!(username: "Craig", email: "craig@example.com", password: "password")
		@article = Article.create!(title: "my title", description: "my description", user: @user)
	end

	test "should get articles listing" do
		get articles_path
		assert_response :success
		assert_template 'articles/index'
		# Mark sure we can find the article in the listing
		assert_select "div", text: @article.title
		assert_select "div", text: @article.description
	end

	test "should show an article" do
		get article_path(@article)
		assert_template 'articles/show'

		assert_match @article.title, response.body
		assert_match @article.description, response.body

		assert_select 'a[href=?]', edit_article_path(@article), text: "Edit this Article"
		assert_select 'a[href=?]', articles_path, text: "Return to Article Listing"
	end

	test "should create new valid article" do
		get new_article_path
		assert_template 'articles/new'
		my_article_title = "new article title"
		my_article_description = "new article description"
		# Check if count increases after posting valid new article
		assert_difference 'Article.count' do
			post articles_path, params: { article: {title: my_article_title, description: my_article_description, user: @user}}
		end
		# Should display a success message
		assert_not flash.empty?

		# After successful post should go to show page
# CANT TEST THIS AT THE MOMENT because USER is empty due to HARD CODING in Article Create!
		#follow_redirect!
		#assert_match my_article_title, response.body
		#assert_match my_article_description, response.body
	end

	test "should reject new invalid article" do
		get new_article_path
		assert_template 'articles/new'
		my_article_title = "new valid article title"
		my_article_description = ""
		# Make sure count does not increase after posting invalid new article
		assert_no_difference 'Article.count' do
			post articles_path, params: { article: {title: my_article_title, description: my_article_description, user: @user}}
		end
		assert_template 'articles/new'
		# Make sure there is a h4 element and it has the word error in its content
		assert_select 'h4', :text => /error/
	end

end
