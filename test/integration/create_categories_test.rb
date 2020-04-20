require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    test "get new category form and create category" do 
        get new_category_path
        assert_template 'category/new'
    end

end