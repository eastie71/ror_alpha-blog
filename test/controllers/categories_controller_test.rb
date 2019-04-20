require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
	def setup
		@category = Category.create(name: "Sports", description: "Sports, such as AFL, Cricket, Hockey")
	end

	test "should get categories index list" do
		get categories_path
		assert_response :success
	end

	test "should get new category" do
		get new_category_path
		assert_response :success
	end

	test "should get show category" do
		get category_path(@category)
		assert_response :success
	end
end