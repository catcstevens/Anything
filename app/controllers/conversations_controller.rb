class ConversationsController < ApplicationController
    
   # use the find_conversation method before the other methods
    before_action :find_conversation!

    def index  
    end
#On the conversation show page @personal_message will call the Personal Message page new
    def show
      @personal_message = PersonalMessage.new
    end

    #On the conversation create page if there is no existing Conversation id between two users, a new conversation will be created. Then redirects to show the conversation.
    def create 
      unless @conversation 
        @conversation = Conversation.create(params.permit(:author_id, :receiver_id))
      end
        redirect_to conversation_personal_messages_path(@conversation)
    end

    #Creates a new personal_message between two users for whom there is a conversation id created in the above method.
    def new
      redirect_to conversation_personal_messages_path(@conversation)
      @personal_message = current_user.personal_messages.build
    end

    
    private
#This method looks to see if a conversation already exists between 2 users. If there is an existing conversation it will redirect to a personal_message. Otherwise it will first create the coversation and then redirect to the personal_messages.
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