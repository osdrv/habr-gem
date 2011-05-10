# encoding: utf-8

require 'spec_helper'

describe Habr::User do

  let(:data) { {:login => login, :karma => karma, :rating => rating, :ratingPosition => ratingPosition} }
  let(:login) { '4pcbr' }
  let(:karma) { 49 }
  let(:rating) { 46.25 }
  let(:ratingPosition) { 871 }

  describe 'instantiates from hash data and respodes to main getters' do

    it 'should create new instance with parameters given' do
      lambda { user = Habr::User.new(data) }.should_not raise_error
    end

    it 'should respond to main getters' do
      user = Habr::User.new(data)
      Habr::User::FIELDS.each do |field|
        lambda { user.send(field) }.should_not raise_error
      end
    end

    it 'user.login method should return "4pcbr"' do
      user = Habr::User.new(data)
      user.login.should eq login
    end

    it 'user.karma should return "49"' do
      user = Habr::User.new(data)
      user.karma.should eq karma
    end

    it 'user.rating should return "46.25"' do
      user = Habr::User.new(data)
      user.rating.should eq rating
    end

    it 'user rating position should return "871"' do
      user = Habr::User.new(data)
      user.ratingPosition.should eq ratingPosition
    end
  end

end
