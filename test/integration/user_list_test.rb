require 'test_helper'
#require 'database_cleaner'

class UserListTest < ActionDispatch::IntegrationTest
  def setup
#logger = Logger.new('logfile.log')
#logger.debug("SETUP User List Test - User Count =#{User.count}")
		@user = User.create!(username: "Craig", email: "craig@example3.com", password: "password")
		@article = Article.create!(title: "my title", description: "my description", user: @user)
	end

	test "should get list of users" do
# Not sure why this is failing - thought it was because article create was hardcoded user? Need to come back here!	
#logger = Logger.new('logfile.log')
#logger.debug("User List Test - User Count =#{User.count}")
#@allusers = User.all
#@allusers.each do |user|
#logger.debug("User ID: #{user.id}, User Username: #{user.username}")
#end
		get users_path
		assert_template 'users/index'
		assert_select "a[href=?]", user_path(@user), text: @user.username
		assert_match "1 article", response.body
	end
end