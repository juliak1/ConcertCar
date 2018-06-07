class Offer < ActiveRecord::Base
	
	has_many :proposals
	belongs_to :user


	def self.search(params)
		
		offers = Offer.where("concert like ?", "%#{params[:concert]}%") if params[:concert].present?
		offers = offers.where("location like ? or route like?", "%#{params[:location]}%" , "%#{params[:location]}%")  if params[:location].present?
		offers = offers.where("price <= ? ", "#{params[:price]}") if params[:price].present?

		offers = Offer.where("concert like ? or route like? or location like? or description like?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%" , "%#{params[:search]}%") if params[:search].present?
		offers
	end
end