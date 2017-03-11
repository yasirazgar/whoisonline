require_relative '../test_helper'

class UserTest < ActiveSupport::TestCase

  def test_scope_online
    users(:yasir).update_attribute(:status, User::Status::ONLINE)
    assert_equal(
      [users(:yasir)], User.online,
      "Should return online users")

    users(:yasir).update_attributes(:status => User::Status::ONLINE, :updated_at => 9.minutes.ago)
    assert_equal(
      [users(:yasir)], User.online,
      "Should return online users")
  end

  def test_scope_away
    users(:yasir).update_attributes(:status => User::Status::ONLINE, :updated_at => 16.minutes.ago)
    assert_equal(
      [users(:yasir)], User.away,
      "Should return online users")
  end

  def test_scope_offiline
    assert_equal(
      [users(:yasir), users(:ash), users(:yash)],
      User.offline,
      "Should return offline users")
  end

  def test_name
    assert_equal('', User.new.name)
    assert_equal('Yasir', User.new(:first_name => 'Yasir').name)
    assert_equal('Azgar', User.new(:last_name => 'Azgar').name)
    assert_equal('Yasir Azgar', User.new(:first_name => 'Yasir', :last_name => 'Azgar').name)
  end

  def test_name_display
    assert_equal('',
      User.new.name_display)
    assert_equal('Yasir',
      User.new(:email => 'email.com', :first_name => 'Yasir').name_display)
    assert_equal('Azgar',
      User.new(:email => 'email.com', :last_name => 'Azgar').name_display)
    assert_equal('Yasir Azgar',
      User.new(:email => 'email.com', :first_name => 'Yasir', :last_name => 'Azgar').name_display)
    assert_equal('email.com',
      User.new(:email => 'email.com').name_display,
      "Should return email only if both first name and last name is not present")
  end
end
