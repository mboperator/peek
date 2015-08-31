Peek::Railtie.routes.draw do
  get '/results' => 'results#show', :as => :results
  get '/hide' => 'results#hide', :as => :hide
end
