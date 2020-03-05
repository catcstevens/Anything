class ListingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :set_category_and_condition, only: [:new, :edit, :create]
    before_action :set_user_listing, only: [:edit, :update, :destroy]
        def index
            @listings = Listing.all
        end
    
        def show
            
        end
    
        def new
            @listing = Listing.new
        end
    
        def create
            @listing = current_user.Listing.create(listing_params)
                
            if @listing.errors.any?
                render "new"
            else
                redirect_to listings_path
            end
    
        end
    
        def edit
            
        end
    
        def update
            
            
            if @listing.update(listing_params)
                redirect_to @listing
            else
                render 'edit'
            end
        end
    
        def destroy
            @listing.destroy
     
            redirect_to listings_path
        end
    
        private
    
        def set_listing
            id = params[:id]
            @listing = Listing.find(id)
        end

        def set_category_and_condition
            @category = Category.all
            @condition = Listing.conditions.keys
        end

        def set_user_listing
            id = params[:id]
            @listing = current_user.listings.find_by_id(id)
        
            if @listing == nil
                redirect_to listings_path
            end
        end
    
        def listing_params
            params.require(:listing).permit(:title, :description, :category, :condition, :price, :deposit, :from, :to, :delivery, :rental_period, :picture)
        end
    
    end