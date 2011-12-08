#Introduction
This is a very very very very very simple [sinatrarb](http://www.sinatrarb.com) application using [DataMapper](http://www.datamapper.org) for persisting objects in a sqlite3 database

What is basically do is receive a post in / containing the parameters 'name' and
'location' and inserting the in the database

If the user performs a GET then the information posted will be shown

# Installation
Ruby and rubygems, of course. And

    gem install gem install data_mapper dm-sqlite-adapter dm-validations

And then run

    ruby main.rb

And you're good to go
