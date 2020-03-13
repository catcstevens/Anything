class ListingsController < ApplicationController
    #Before doing crud perform these actions: authenticate useer with devise, perform the private methods below for the pages shown in square brackets.
    before_action :authenticate_user!
    before_action :set_listing, only: [:show, :destroy]
    before_action :set_category_and_condition, only: [:new, :edit, :create]
    before_action :set_user_listing, only: [:edit, :update, :destroy]
      
    #search the listings page for listings.
    def index
            @search = Listing.search(params[:q])
            @listings = @search.result
            
        end
    
        # Set the id of the user of the listing as the listing owner
        def show
            @listing_owner = @listing.user_id

            if current_user
                borrower_id = current_user.id
                user_email = current_user.email

            else
                borrower_id = nil
                user_email = nil

            end

#Stripe method for user payment - transaction handled externally. Edit in payment views.
                session = Stripe::Checkout::Session.create(
                    payment_method_types: ['card'],
                    customer_email: current_user.email,
                    line_items: [{
                        name: @listing.title,
                        description: @listing.description,
                        amount: @listing.deposit * 100,
                        currency: 'aud',
                        quantity: 1,
                    }],
                    payment_intent_data: {
                        metadata: {
                            user_id: current_user.id,
                            listing_id: @listing.id
                        }
                    },
                    success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
                    cancel_url: "#{root_url}listings"
                )
            
                @session_id = session.id
        end   
    #create a new lisint in listings/new
        def new
            @listing = Listing.new
            @user_id = current_user.id
            puts "USER #{@user_id}"
        end
    
        def create
            @listing = current_user.listings.create(listing_params)
            
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
#for the category field in listings - drop box and the listing condition radio buttons.
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
    #when creating a listing these are the parameters accepted in the form.
        def listing_params
            params.require(:listing).permit(:title, :description, :category_id, :condition, :price, :deposit, :from, :to, :delivery, :rental_period, :picture )
        end
    
    end