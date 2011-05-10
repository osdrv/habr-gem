# encoding: utf-8

require 'spec_helper'

describe Habr::Loader do

  let(:username1) { '4pcbr' }
  let(:username2) { '_4pcbr_' }

  describe 'Load data for valid username = "4pcbr"' do

    it 'should not raise error if data is valid' do
      lambda { Habr::Loader.load_user_data(username1) }.should_not raise_error
    end

    it 'login data should eq "4pcbr"' do
      data = Habr::Loader.load_user_data(username1)
      data[:login].should eq username1.to_s
    end

  end

  describe 'Load data with invalid username' do

    it 'should raise error after loading' do
      lambda { Habr::Loader.load_user_data(username2) }.should raise_error RuntimeError
    end

  end

end