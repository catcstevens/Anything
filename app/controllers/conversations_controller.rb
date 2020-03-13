class ConversationsController < ApplicationController
    
    # before_action :set_conversation, except: [:index]
    # before_action :check_participating!, except: [:index]
    before_action :find_conversation!
    def index
      # @conversations = Conversation.participating(current_user).order('updated_at DESC')
      
      
    end

    def show
      @personal_message = PersonalMessage.new
    end

    def create 
      unless @conversation 
        @conversation = Conversation.create(params.permit(:author_id, :receiver_id))
      end
      redirect_to conversation_personal_messages_path(@conversation)
    end

    def new
      redirect_to conversation_personal_messages_path(@conversation)
      @personal_message = current_user.personal_messages.build
    end

    
    private

def find_conversation!
  if params[:receiver_id]
    @receiver = User.find_by(id: params[:receiver_id])
    @conversation = Conversation.between(current_user.id, @receiver.id)[0]
    if @conversation
      redirect_to conversation_personal_messages_path(@conversation)
    else
      @conversation = Conversation.create(params.permit(:author_id, :receiver_id))
      redirect_to conversation_personal_messages_path(@conversation)
    end
  else
    @conversation = Conversation.find_by(id: params[:conversation_id])
    # redirect_to(root_path) unless @conversation && @conversation.participates?(current_user)
  end
end
end