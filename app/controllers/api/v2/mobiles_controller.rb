module Api
    module V2
        class MobilesController < ApplicationController
          skip_before_action :verify_authenticity_token
          skip_before_action :authenticate_request, only: %i[login, create]
          # POST /register
           def create
             @user = User.create(user_params)
            if @user.save
             response = { success: 'true', message: 'You have Successfully Registered'}
             render json: response, status: :created 
            else-if is_email_valid
              render json: { success: 'false', message: 'User already exists'}
            else
              render json:{success: 'false', message:'Invalid email' }, status: :unprocessable_entity
            end 
           end
          end

          def is_email_valid 
            @user.email =~ /@peerlogicsys.com/
          end
       
           def login
             authenticate params[:email], params[:password]
           end
           def test
             render json: {
                   message: 'You have passed  '
                 }
           end
       
       
           def authenticate(email, password)
               command = AuthenticateUser.call(email, password)
           
               if command.success?
                 render json: {
                   access_token: command.result,
                   message: 'Login Successful'
                 }
               else
                 render json: { error: command.errors }, status: :unauthorized
               end
              end  
       
       
         
           private
         
           def user_params
             params.permit(
               :name,
               :email,
               :password
             )
           end
         end
        end
      end