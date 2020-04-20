require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    
    def setup
        @category = Category.new(name: "Sports")
    end

    test "Category should be valid" do
        assert @category.valid?        
    end

    test "Category name should not be blank" do
        @category.name=""
        assert_not @category.valid?
    end

    test "name should not be grater the 25 characters" do 
        @category.name = "a" * 26
        assert_not @category.valid?
    end

    test "name should not be less than 3 characters" do
        @category.name = "aa"
        assert_not @category.valid?
    end
end
