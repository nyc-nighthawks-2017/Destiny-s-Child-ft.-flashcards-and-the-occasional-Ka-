get '/guesses' do
  @guesses = Guess.all #define instance variable for view
  erb :'guesses/index' #show all guesses view (index)
end


get '/guesses/new' do
  erb :'guesses/new' #show new guesses view
end


post '/guesses' do
  @guess = Guess.new(params[:card]) #create new card
    if @guess.save #saves new card or returns false if unsuccessful
      redirect '/guesses' #redirect back to guesses index page
    else
      erb :'guesses/new' # show new guesses view again(potentially displaying errors)
    end
end


get '/guesses/:id' do
  #gets params from url
    @guess = Guess.find_by(params[:id]) #define instance variable for view
    erb :'guesses/show' #show single card view
end


get '/guesses/:id/edit' do
  #get params from url
  @guess = Guess.find_by(params[:id]) #define intstance variable for view
  erb :'guesses/edit' #show edit card view
end


put '/guesses/:id' do
  #get params from url
  @guess = Guess.find_by(params[:id]) #define variable to edit
  @guess.assign_attributes(params[:card]) #assign new attributes
    if @guess.save #saves new card or returns false if unsuccessful
      redirect '/guesses' #redirect back to guesses index page
    else
      erb :'guesses/edit' #show edit card view again(potentially displaying errors)
    end
end


delete '/guesses/:id' do
  #get params from url
  @guess = Guess.find_by(params[:id]) #define card to delete
  @guess.destroy #delete card
  redirect '/guesses' #redirect back to guesses index page
end
