class OffersController < ApplicationController
before_action :authenticate_user!, except: [:index, :search]
  def index
    @offers = Offer.all.order(" open DESC, created_at DESC").page(params[:page]).per(25)
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
    redirect_to @offer
    else
    flash[:error] = @offer.errors.full_messages.to_sentence
    render :new
  end
  end

  def show
    @offer = Offer.find(params[:id])
    @proposals = @offer.proposals.order(created_at: :desc)
    @awarded_proposal = Proposal.where(id: @offer.awarded_proposal).first
    end

    def edit
      @offer = Offer.find(params[:id])
      if current_user != @offer.user
        flash[:error] = "You are not the owner!"
        redirect_to @offer
      end
    end

    def update
      @offer = Offer.find(params[:id])
      if current_user == @offer.user
        @offer.update(offer_params)
      else
        flash[:error] = "You are not the owner!"
      end
      redirect_to @offer
    end

    def destroy
      @offer = Offer.find(params[:id])
      if current_user == @offer.user
      @offer.destroy
      else
        flash[:error] = "You are not the owner!"
      end
      redirect_to :myoffers
    end

    def search
      @offers = Offer.search(params).page(params[:page]).per(25)
    end

    def myoffers
      @offers = Offer.where(user_id: current_user).order(created_at: :desc)
    end


  private

  def offer_params
    params.require(:offer).permit(:concert, :description, :route, :price, :location, :open, :awarded_proposal )
  end
end