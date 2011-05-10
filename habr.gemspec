# encoding: utf-8

Gem::Specification.new do |s|
  s.name = 'habr'
  s.version = '0.0.1'
  s.date = '2011-05-11'

  s.summary = 'Use it when you need to get habrahabr user data'
  s.description = 'Simple HTTP mapper for habrahabr.ru user data API'
  s.authors = ['4pcbr']
  s.email = 'i4pcbr@gmail.com'

  s.files = %w[
    README.md
    lib/habr.rb
    Rakefile
    spec/spec_helper.rb
    spec/habr/loader_spec.rb
    spec/habr/user_spec.rb
  ]

  s.extra_rdoc_files = %w[README.md]

  s.add_dependency 'nokogiri'

  s.homepage = 'https://github.com/4pcbr/habr-gem'
  s.require_paths = %w[lib]
end