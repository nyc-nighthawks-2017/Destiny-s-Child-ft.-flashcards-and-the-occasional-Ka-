get '/rounds' do
  @rounds = Round.all #define instance variable for view
  erb :'rounds/index' #show all rounds view (index)
end


get '/rounds/new' do
  erb :'rounds/new' #show new rounds view
end


post '/decks/:deck_id/rounds' do

  @round = Round.new(deck_id: params[:deck_id], user_id: current_user.id)
    if @round.save #saves new card or returns false if unsuccessful
      redirect "/rounds/#{@round.id}" #redirect back to rounds index page
    else
      erb :'rounds/index' # show new rounds view again(potentially displaying errors)
    end
end


get '/rounds/:id' do

    @round = Round.find_by(id: params[:id])
    erb :'rounds/show' #show single card view
end

post '/rounds/:id' do
  @round = Round.new(params[:card]) #create new card
    if @round.save #saves new card or returns false if unsuccessful
      redirect "/rounds/#{round.id}" #redirect back to rounds index page
    else
      erb :'rounds/new' # show new rounds view again(potentially displaying errors)
    end
end


get '/rounds/:id/edit' do
  #get params from url
  @round = Round.find_by(params[:id]) #define intstance variable for view
  erb :'rounds/edit' #show edit card view
end


put '/rounds/:id' do
  #get params from url
  @round = Round.find_by(params[:id]) #define variable to edit
  @round.assign_attributes(params[:card]) #assign new attributes
    if @round.save #saves new card or returns false if unsuccessful
      redirect '/rounds' #redirect back to rounds index page
    else
      erb :'rounds/edit' #show edit card view again(potentially displaying errors)
    end
end


delete '/rounds/:id' do
  #get params from url
  @round = Round.find_by(params[:id]) #define card to delete
  @round.destroy #delete card
  redirect '/rounds' #redirect back to rounds index page
end
