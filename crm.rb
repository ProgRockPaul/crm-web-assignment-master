
require_relative 'contact'
require 'sinatra'

Contact.create('Betty', 'Maker', 'betty@bitmakerlabs.com', 'Developer')
Contact.create('Paul', 'Walsh', 'twentytwentyk@live.com', 'Local Bard')
Contact.create('John', 'Petrucci', 'bearucci@gmail.com', 'Local Bear')
Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')

get '/' do
  @crm_app_name = "Paul's CRM"
  erb :index
end

get '/' do

end

get '/contacts' do
  erb :contacts
end
# :contacts is a route from crm.rb to contacts.erb
get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

get '/contacts/1' do
  @contact = Contact.find(1)
  erb :show_contact
end
