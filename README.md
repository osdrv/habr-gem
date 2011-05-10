Habrahabr gem
=============

This is a habrahabr uer data API gem.

API is documented here: http://habrahabr.ru/info/help/api/

Usage:
------

  require 'rubygems'

  user = Habr::User.find_by_name('4pcbr')
  puts user.login # output login: '4pcbr'
  puts user.karma # will output current user karma
  puts user.rating # will output current user rating
  puts user.ratingPosition # will output current user position in rating table
