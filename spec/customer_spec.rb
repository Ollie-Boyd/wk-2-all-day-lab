require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../customer.rb')
require_relative('../drink.rb')


class TestCustomer < Minitest::Test





end