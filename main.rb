require 'sinatra'
require 'rubygems'
require 'data_mapper'
require 'dm-validations'
require 'dm-migrations'
require 'logger'
require 'haml'
set :views, File.join(File.dirname(__FILE__), 'views')
set :logging, true

class Victory
		include DataMapper::Resource

		property :id,           Serial
		property :name,         String
		property :location,     String
		property :created_at,   DateTime
end

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup( :default , "sqlite3://#{Dir.pwd}/development.sqlite3" )
DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
		@victories = Victory.all :order => [:created_at]
		@victories.reverse!
		haml :index
end

get '/form' do
		erb :form
end

post '/' do
		victory = Victory.create(
														:name => params[:name],
														:location => params[:location],
														:created_at => Time.now)
		redirect '/'
end
