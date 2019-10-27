Rails.application.routes.draw do
  match 'wrappers/show', :via =>[:post, :get]
  root 'wrappers#show'
end
