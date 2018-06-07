class ProposalsController < ApplicationController
def create
		@offer = Offer.find(params[:offer_id])

		@proposal = @offer.proposals.build(proposal_params)
	 	@proposal.save
		redirect_to @proposal.offer
				
	end

	def edit
      @proposal = Proposal.find(params[:id])
      if current_user != @proposal.user
        flash[:error] = "You are not the owner!"
        redirect_back(fallback_location: root_path)
      end
    end

    def update
      @proposal = Proposal.find(params[:id])
      if current_user == @proposal.user
        @proposal.update(proposal_params)
      else
        flash[:error] = "You are not the owner!"
      end
      redirect_to @proposal.offer
    end

	def destroy
		
      @proposal = Proposal.find(params[:id])
      if current_user == @proposal.user
      @proposal.destroy
      else
        flash[:error] = "You are not the owner!"
      end
      redirect_back(fallback_location: root_path)
    end

	private

	def proposal_params
		params.require(:proposal).permit(:bid, :description, :user_id)
	end
end