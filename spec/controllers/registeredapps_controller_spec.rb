# require 'rails_helper'
require 'rspec/rails'

RSpec.describe RegisteredappsController, type: :controller do

  let(:my_registeredapp) {Registeredapp.create!(name: "Registered Application", url: "https://www.bloc.io" )}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_registeredapp to @registeredapps]" do
      get :index
      expect(assigns(:registeredapps)).to eq([my_registeredapp])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @registeredapp" do
      get :new
      expect(assigns(:registeredapp)).not_to be_nil
    end
  end

  describe "POST #create" do

    it "increases the number of Registeredapp by 1" do
      expect{registeredapp :create, registeredapp: {name: "Registered Application", url: "https://bloc.io"}}
    end

    it "assigns the new registeredapp to @registeredapp" do
      registeredapp :create, registeredapp: {name: "Registered Application", url: "https://bloc.io"}
      expect(assigns(:registeredapp)).to eq Registeredapp.last
    end

    it "redirects to the new registered application" do
      registeredapp :create, registeredapp: {name: "Registered Application", url: "https://bloc.io"}
      expect(response).to redirect_to Registeredapp.last
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_registeredapp.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_registeredapp.id}
      expect(response).to render_template :show
    end

    it "assigns my_registeredapp to @registeredapp" do
      get :show, {id: my_registeredapp.id}
      expect(assigns(:registeredapp)).to eq(my_registeredapp)
    end

  end


  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_registeredapp.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_registeredapp.id}
      expect(response).to render_template :edit
    end

    it "assigns registeredapp to be updated to @registeredapp" do
      get :edit, {id: my_registeredapp.id}
      registeredapp_instance = assigns(:registeredapp)

      expect(registeredapp_instance.id).to eq my_registeredapp.id
      expect(registeredapp_instance.name).to eq my_registeredapp.name
      expect(registeredapp_instance.url).to eq my_registeredapp.url
    end
  end

  describe "PUT #update" do
    it "updates registered app with expected attributes" do
      new_name = "Updated app name"
      new_url = "https://google.com"

      put :update, id: my_registeredapp.id, registeredapp: {name: new_name, url: new_url}

      updated_registeredapp = assigns(:registeredapp)
      expect(updated_registeredapp.id).to eq my_registeredapp.id
      expect(updated_registeredapp.name).to eq new_name
      expect(updated_registeredapp.url).to eq new_url
    end

    it "redirects to the updated registered app" do
      new_name = "New updated app name"
      new_body = "https://blabla.bla"

      put :update, id: my_registeredapp.id, registeredapp: {name: new_name, url: new_url}
      expect(response).to redirect_to my_registeredapp
    end
  end

  describe "DELETE #destroy" do
    it "deletes the registeredapp " do
      delete :destroy, {id: my_registeredapp.id}

      count = Registeredapp.where({id: my_registeredapp.id}).size
      expect(count).to eq 0
    end

    it "redirects to registeredapps index" do
      delete :destroy, {id: my_registeredapp.id}
      expect(response).to redirect_to registeredapps_path
  end

end
