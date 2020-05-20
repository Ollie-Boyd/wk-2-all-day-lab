require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')


class TestPub < Minitest::Test





end