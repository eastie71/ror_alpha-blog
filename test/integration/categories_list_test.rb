require 'test_helper'

class CategoriesListTest < ActionDispatch::IntegrationTest
	def setup
		@category = Category.create(name: "Sports", description: "All year round, indoor and outdoor.")
		@category2 = Category.create(name: "Travel", description: "All around the World")
		@admin_user = User.create!(username: "Craig", email: "craig@example.com", password: "password", admin: true)
	end

	test "should show list of categories" do
		get categories_path
		assert_template 'categories/index'
		assert_select "a[href=?]", category_path(@category), text: @category.name
		assert_select "a[href=?]", category_path(@category2), text: @category2.name
	end
  
end
