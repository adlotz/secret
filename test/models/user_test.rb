require 'test_helper'

class UserTest < ActiveSupport::TestCase
 	def setup
	@user = User.new(email: "example@email.com", password: "passwordexample", password_confirmation: "passwordexample")
	end

  	test "email should be present" do 
  	@user.email = "     "
  	assert_not @user.valid?
 	end

 	test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
	end

  	test "password should be present" do 
    @user.password = @user.password_confirmation = "      "
    assert_not @user.valid?
	end

    test "password should not be too long" do 
    @user.password = @user.password_confirmation = "a" * 51
    assert_not @user.valid?
  	end

  	test "password should have a minimum length" do 
    @user.password = @user.password_confirmation = "a" * 3
    assert_not @user.valid?
	end

end
