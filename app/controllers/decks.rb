get '/' do
  @decks = Deck.all #define instance variable for view
  erb :index #show all decks view (index)
end


get '/decks/new' do
  erb :'decks/new' #show new decks view
end


post '/decks' do
  @deck = Deck.new(params[:card]) #create new card
    if @deck.save #saves new card or returns false if unsuccessful
      redirect '/decks' #redirect back to decks index page
    else
      erb :'decks/new' # show new decks view again(potentially displaying errors)
    end
end


get '/decks/:id' do
  #gets params from url

    @deck = Deck.find_by(id: params[:id]) #define instance variable for view
    erb :'decks/show' #show single card view
end



get '/decks/:id/edit' do
  #get params from url
  @deck = Deck.find_by(params[:id]) #define intstance variable for view
  erb :'decks/edit' #show edit card view
end


put '/decks/:id' do
  #get params from url
  @deck = Deck.find_by(params[:id]) #define variable to edit
  @deck.assign_attributes(params[:card]) #assign new attributes
    if @deck.save #saves new card or returns false if unsuccessful
      redirect '/decks' #redirect back to decks index page
    else
      erb :'decks/edit' #show edit card view again(potentially displaying errors)
    end
end


delete '/decks/:id' do
  #get params from url
  @deck = Deck.find_by(params[:id]) #define card to delete
  @deck.destroy #delete card
  redirect '/decks' #redirect back to decks index page
end
