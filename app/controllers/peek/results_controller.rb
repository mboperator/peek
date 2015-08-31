module Peek
  class ResultsController < ApplicationController
    before_filter :restrict_non_access
 
    # Procore - Skip Authorize
    skip_before_filter :authorize
    skip_before_filter :verify_authenticity_token

    def show
      respond_to do |format|
        format.json do
          if request.xhr?
            render :json => Peek.adapter.get(params[:request_id])
          else
            render :nothing => true, :status => :not_found
          end
        end
      end
    end

    def hide
      session[:peek] = false 

      redirect_to :back
    end

    private

    def restrict_non_access
      unless peek_enabled?
        raise ActionController::RoutingError.new('Not Found')
      end
    end
  end
end
