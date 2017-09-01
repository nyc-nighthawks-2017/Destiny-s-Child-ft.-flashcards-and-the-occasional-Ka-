get '/cards' do
  @cards = Card.all #define instance variable for view
  erb :'cards/index' #show all cards view (index)
end


get '/cards/new' do
  erb :'cards/new' #show new cards view
end


post '/cards' do
  @card = Card.new(params[:card]) #create new card
    if @card.save #saves new card or returns false if unsuccessful
      redirect '/cards' #redirect back to cards index page
    else
      erb :'cards/new' # show new cards view again(potentially displaying errors)
    end
end


get '/cards/:id' do
  #gets params from url
    @card = Card.find_by(params[:id]) #define instance variable for view
    erb :'cards/show' #show single card view
end


get '/cards/:id/edit' do
  #get params from url
  @card = Card.find_by(params[:id]) #define intstance variable for view
  erb :'cards/edit' #show edit card view
end


put '/cards/:id' do
  #get params from url
  @card = Card.find_by(params[:id]) #define variable to edit
  @card.assign_attributes(params[:card]) #assign new attributes
    if @card.save #saves new card or returns false if unsuccessful
      redirect '/cards' #redirect back to cards index page
    else
      erb :'cards/edit' #show edit card view again(potentially displaying errors)
    end
end


delete '/cards/:id' do
  #get params from url
  @card = Card.find_by(params[:id]) #define card to delete
  @card.destroy #delete card
  redirect '/cards' #redirect back to cards index page
end
