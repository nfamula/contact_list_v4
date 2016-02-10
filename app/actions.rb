# Homepage (Root path)
get '/' do
  erb :index
end

get '/contacts' do
    Contact.all.to_json
end 

post '/contacts/create' do
    response = Hash.new
    response[:result] = false
    contact = Contact.new(name: params[:name], email: params[:email], phone: params[:phone])

    if contact.save
        response[:result] = true
        response[:id] = contact.id
    end
    response.to_json
end
