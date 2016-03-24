require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets schools instance variable' do
      school = School.create(name: 'UCF')
      get :index
      expect(assigns(:schools)).to eq([school])
    end 

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end 
  end


  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it 'sets the school instance variable' do 
      @school = School.create(name: 'UM')
      get :show, id: @school.id
      expect(assigns(:school)).to eq(@school)
    end

    it 'renders show template' do
      @school = School.create(name: 'FSU')
      get :show, id: @school.id
      expect(response).to render_template(:show)
    end 
  end


  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'sets the new instance variable' do 
      get :new
      expect(assigns(:school)).to_not be(:nil)
      expect(assigns(:school).class).to eq(School)
    end 

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end 
  end


  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end

    it 'sets the instance variable' do
      @school = School.create(name: 'Harvard')
      get :edit, id: @school.id
      expect(assigns(:school)).to eq(@school)
    end 

    it 'renders the edit template' do
      @school = School.create(name: 'Harvard')
      get :edit, id: @school.id
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    it 'successfully creates a school' do
      post :create, {school: {name: 'PBSC'}}
      expect(School.count).to eq(1)
      expect(School.first.name).to eq('PBSC')
    end

    it 'redirects to schools index upon success' do
      post :create, {school: {name: 'IRSC'}}
      expect(response).to redirect_to(schools_path)
    end 

    it 'fails to create a school without a name' do 
      post :create, {school: {name: ''}}
      expect(School.count).to eq(0)
    end 

    it 'renders the new template upon error' do
      post :create, {school: {name: ''}}
      expect(response).to render_template(:new)
    end 
  end 

  describe "PUT #update" do
    it 'updates the school name' do
      @school = School.create(name: 'FSU')
      put :update, {id: @school.id, school: {name: 'updated'}}
      expect(@school.reload.name).to eq('updated')
    end 

    it 'redirects to the school index upon success' do
      @school = School.create(name: 'FSU')
      put :update, {id: @school.id, school: {name: 'updated'}}
      expect(response).to redirect_to(schools_path) 
    end 

    it 'does not update upon error' do 
      @school = School.create(name: 'FSU')
      put :update, {id: @school.id, school: {name: ''}}
      expect(@school.reload.name).to eq('FSU')
    end 

    it 'renders the edit template upon error' do 
      @school = School.create(name: 'FSU')
      put :update, {id: @school.id, school: {name: ''}}
      expect(response).to render_template(:edit)
    end 
  end 

  describe "DELETE #destroy" do 
    it 'successfully deletes a school' do
      @school = School.create(name: 'FSU')
      delete :destroy, id: @school.id
      expect(School.count).to eq(0)
    end 

    it 'redirects to school index upon success' do
      @school = School.create(name: 'FSU')
      delete :destroy, id: @school.id
      expect(response).to redirect_to(schools_path)
    end 

  end 

end
