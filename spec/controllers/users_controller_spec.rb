require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with invalid params" do    
       it "validates presence of username and password" do
         post :create, params: { user: { username: "Cam", password: "" } }
         expect(response).to render_template("new")
        #  expect(flash[:errors]).to be_present
       end

       it "validates password has length >= 6" do
         post :create, params: { user: { username: "Cam", password: "short" } }
         expect(response).to render_template("new")
        #  expect(flash[:errors]).to be_present
       end
    end

    context "with valid params" do
      it "redirects to user show page on success" do  
        post :create, params: { user: { username: "Cam", password: "password" } }
        expect(response).to redirect_to(user_url(User.last))
      end
      
    end
  end
end
