require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "that a status requires content" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that a status content is at least 2 letters long" do
  	status = Status.new
  	status.content = "H"
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "statuses have a user id" do
  	status = Status.new
  	status.content = "Hello"
  	user_id = ""
  	assert !status.save
  	assert !status.errors[:content].empty?
  end
end
