require 'rubygems'
require 'spork'

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each do |f|
  require f
end
