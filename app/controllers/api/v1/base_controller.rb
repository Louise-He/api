# app/controllers/api/v1/base_controller.rb
class Api::V1::BaseController < ActionController::Base
      rescue_from StandardError, with: :internal_server_error
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
private

      def internal_server_error(exception)
             if Rails.env.development?
                   response = { type: exception.class.to_s, error: exception.message }
             else
                   response = { error: "Internal Server Error" }
             end
             render json: response, status: :internal_server_error
      end
end
