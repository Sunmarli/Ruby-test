require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  test "should not save author without first name" do
    author = Author.new(
      last_name: "Dan",
      email: "dan.bober@example.com"
    )
    assert_not author.save
  end
  test "should not save author without last name" do
    author = Author.new(
      first_name: "Dan",
      email: "dan.bober@example.com"
    )
    assert_not author.save
  end
  test "should not save author without email" do
    author = Author.new(
      first_name: "Dan",
      last_name: "Bober"
      
    )
    assert_not author.save
  end
  test "email should be unique" do
    existing_author = authors(:one) 
    new_author = Author.new(first_name: "Ranin", last_name: "Kotkas", email: existing_author.email)

    assert_not new_author.valid?
    assert_equal ["has already been taken"], new_author.errors[:email]
  end
  test "should not save author with non-unique email" do
    existing_author = authors(:one)
    author = Author.new(
      first_name: "John",
      last_name: "Doe",
      email: existing_author.email
    )
    assert_not author.save
  end

end
