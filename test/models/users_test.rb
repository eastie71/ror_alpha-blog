require 'test_helper'

class UsersTest < ActiveSupport::TestCase
  def setup
		@user = User.create!(username: "Craig", email: "craig@example.com", password: "password")
	end

	test "user should be valid" do
		assert @user.valid?
	end

	test "username cannot be blank" do
		@user.username = ""
		assert_not @user.valid?
	end

	# test "user password cannot be empty" do
	# 	@user.password = ""
	# 	assert_not @user.valid?
	# end

	test "username cannot be too short" do
		@user.username = "A"
		assert_not @user.valid?
	end

	test "user email must be valid" do
		@user.email = "fred.email.com"
		assert_not @user.valid?
		@user.email = ""
		assert_not @user.valid?
		@user.email = "fred@email"
		assert_not @user.valid?
	end

	test "user valid with valid email" do
		@user.email = "fred.MY.VERY.LONG22.NAME@email.com.VIC.GOV.AU"
		assert @user.valid?
	end

end
