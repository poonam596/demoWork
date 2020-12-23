module Api
    module V2
        class CandidateapiController < ApplicationController 
            skip_before_action :verify_authenticity_token
            before_action :authenticate_request!, except: [:create, :show, :destroy, :update, :index]   
            respond_to :json

            def index
                candidate_details = CandidateDetail.order('created_at DESC');
                render json: {success: 'true', message:'Loaded Candidate Details', data:candidate_details},status: :ok
            end

            def show
                candidate_detail = CandidateDetail.find(params[:id])
                render json: {success: 'true', message:'Loaded Candidate Details', data:candidate_detail},status: :ok
            end

            def create 
                candidate_detail = CandidateDetail.new(candidate_detail_params)

                if candidate_detail.save
                    render json: {success: 'true', message:'Saved Candidate Details', data:candidate_detail},status: :ok
                else
                    render json: {success: 'false', message:'Candidate Details not saved', data:candidate_detail.errors},status: :unprocessable_entity
                end
            end

            def destroy
                candidate_detail = CandidateDetail.find(params[:id])
                candidate_detail.destroy
                render json: {success: 'true', message:'Candidate Details Deleted', data:candidate_detail},status: :ok
            end

            def update
                candidate_detail = CandidateDetail.find(params[:id])
                if candidate_detail.update_attributes(candidate_detail_params)
                    render json: {success: 'true', message:'Updated Candidate Details', data:candidate_detail},status: :ok
                else 
                    render json: {success: 'false', message:'Candidate Details not found', data:candidate_detail.errors},status: :unprocessable_entity
                end
            end



                private

                def candidate_detail_params
                    params.permit(:first, :last, :email, :phone, :degree, :percentage, :experience, :platform, :file)

                end
        end
    end
end
