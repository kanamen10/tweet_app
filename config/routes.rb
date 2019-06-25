Rails.application.routes.draw do
  root 'application#hello'
  get 'bye', to: 'application#bye'
end
