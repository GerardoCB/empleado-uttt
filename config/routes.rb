Rails.application.routes.draw do
  resources :empleados
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :generate_pdf, to: "documents#generate_pdf"
  root  "empleados#index"
end
