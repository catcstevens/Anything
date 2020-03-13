class PersonalMessagesController < ApplicationController
    before_action :find_conversation!
  
    def new
        redirect_to conversation_path(@conversation) and return if @conversation
        @personal_message = current_user.personal_messages.build
      end
      
#create a conversation between the current user and the the receiver. Create personal message with the conversation id. Save personal message. Send confirmation and save
      def create
        @conversation ||= Conversation.create(author_id: current_user.id,
              receiver_id: @receiver.id)
        @personal_message = current_user.personal_messages.build(personal_message_params)
        @personal_message.conversation_id = @conversation.id
        @personal_message.save!
      
        flash[:success] = "Your message was sent!"
        redirect_to conversation_personal_messages_path(@conversation)
      end

      #index of all conversations the user is involved with .
      def index
        @messages = @conversation.personal_messages
        @receiver = User.find(@conversation.receiver_id)

        @message = @conversation.personal_messages.new

      end
  
    private
  
    def personal_message_params
      params.require(:personal_message).permit(:body)
    end
  #The personal_message needs a conversation to belong to, so before initializing a personal_message the conversation needs to be found between the two users. If it doesn't exist it needs to be created.
    def find_conversation!
        if params[:receiver_id]
          @receiver = User.find_by(id: params[:receiver_id])
          redirect_to(root_path) and return unless @receiver
          @conversation = Conversation.between(current_user.id, @receiver.id)[0]
        else
          @conversation = Conversation.find_by(id: params[:conversation_id])
          redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
        end
  end
end