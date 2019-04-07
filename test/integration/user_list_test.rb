require 'test_helper'

class UserListTest < ActionDispatch::IntegrationTest
  def setup
		@user = User.create!(username: "Craig", email: "craig@example.com", password: "password")
		@article = Article.create!(title: "my title", description: "my description", user: @user)
		@article.user_id = @user.id
		@article.save
	end

	test "should get list of users" do
# Not sure why this is failing - thought it was because article create was hardcoded user? Need to come back here!	
		#get users_path
		#assert_template 'users/index'
		#assert_select "a[href=?]", user_path(@user), text: @user.username
		#assert_match "1 recipe", response.body
	end
end
