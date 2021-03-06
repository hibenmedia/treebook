require 'test_helper'

class UserTest < ActiveSupport::TestCase
	should have_many(:user_friendships)
	should have_many(:friends)

	test "a user should enter a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter a profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a unique profile name" do
		user = User.new
		user.profile_name = users(:mark).profile_name

		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a username without spaces" do
		user = User.new(first_name: 'Mark', last_name: 'Hipshire', profile_name: 'jhipshir', email: 'jhipshir2@gmail.com')
		user.password = user.password_confirmation = 'password'
		
		user.profile_name = "My Profile With Spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "a user can have a correctly formatted profile_name" do
		user = User.new(first_name: 'Mark', last_name: 'Hipshire', profile_name: 'jhipshir', email: 'jhipshir2@gmail.com')
		user.password = user.password_confirmation = 'password'

		user.profile_name = 'jhipshir_1'
		assert user.valid?
	end

	test 'that no error is raised when trying to get to access a friends list' do
		assert_nothing_raised do
			users(:jason).friends
		end
	end

	test 'that creating friendships on a user works' do
		users(:jason).friends << users(:mark)
		users(:jason).friends.reload
		assert users(:jason).friends.include?(users(:mark))
	end
end