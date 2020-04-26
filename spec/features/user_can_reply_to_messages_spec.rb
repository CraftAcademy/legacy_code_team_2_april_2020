feature 'User can reply to a message' do
  let(:sender) { create(:user, email: 'sender@mail.com') }
  let(:receiver) { create(:user, name: 'reciever', email: 'sender1@mail.com') }
  before do
    sender.send_message(receiver, 'Lorem ipsum...', 'Subject')
  end
  describe 'user/receiver replies to message' do
    before do
      count = receiver.mailbox.inbox.count
      expect(count).to eq 1
      conversation = receiver.mailbox.inbox.first
      receipts = conversation.receipts_for receiver
      receiver.reply_to_sender(receipts[0], "Nullam interdum auctor ipsum")
    end

    it 'sender should have 1 new message in the inbox' do
      count = sender.mailbox.inbox.count
      expect(count).to eq 1
    end

    it 'user should see the replied message' do
      conversation = sender.mailbox.inbox.first
      expect(conversation.messages[2]) == 'Nullam interdum auctor ipsum'
    end
  end

end
