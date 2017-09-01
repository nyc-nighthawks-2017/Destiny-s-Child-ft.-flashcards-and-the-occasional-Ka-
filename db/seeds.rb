content_for_cards = [
  { :question => "1+1", :answer => 2, :deck_id => 1},
  { :question => "1+2", :answer => 3, :deck_id => 1},
  { :question => "1+3", :answer => 4, :deck_id => 1},
  { :question => "1+4", :answer => 5, :deck_id => 1},
  { :question => "1+5", :answer => 6, :deck_id => 1},
  { :question => "1+6", :answer => 7, :deck_id => 1},
  { :question => "1+7", :answer => 8, :deck_id => 1}, ]

Deck.create(title: "Math", user_id: 1)
Card.create!(content_for_cards)
