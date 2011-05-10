require 'nokogiri'
require 'open-uri'
require 'cgi'

module Habr

  HABR_API_PROFILE_URL = 'http://habrahabr.ru/api/profile/%%username%%/'

  class Loader

    class << self

      def load_user_data(user_name)
        url = Habr::HABR_API_PROFILE_URL.gsub('%%username%%', CGI.escape(user_name)).to_s
        doc = Nokogiri::XML(open(url,
          'Content-type' => 'text/xml',
          'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_7) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.57 Safari/534.24'
        ))
        data = {}
        error = nil
        doc.css('habrauser error').each do |e|
          error = e.content.to_s
        end
        raise "Data loading error: #{error}" if !error.nil?
        Habr::User::FIELDS.each do |f|
          doc.css("habrauser #{f.to_s}").each do |field|
            data[f] = field.content.to_s
          end
        end
        data
      end

    end

  end

  class User

    FIELDS = [:login, :karma, :rating, :ratingPosition]

    FIELDS.each do |f|
      attr_accessor f
    end

    def initialize(data)
      FIELDS.each do |f|
        # instance_variable_set(f, data[f]) if !data[f].nil?
        send("#{f.to_s}=".to_sym, data[f]) if !data[f].nil?
      end
    end

    class << self

      def find_by_name(name)
        begin
          data = Habr::Loader.load_user_data
          Habr::User.new(data)
        rescue => e
          nil
        end
      end

    end

  end

end
