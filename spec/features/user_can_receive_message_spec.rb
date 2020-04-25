# frozen_string_literal: true

feature 'User can receieve message' do
  let(:sender) { create(:user, email: 'sender@mail.com') }
  let(:receiver) { create(:user, name: 'reciever', email: 'sender1@mail.com') }
  before do
    sender.send_message(receiver, 'Lorem ipsum...', 'Subject')
  end
  describe 'receiver checks for message in inbox' do
    it 'receiver should have 1 new message' do
      count = receiver.mailbox.inbox.count
      expect(count).to eq 1
    end
    it 'reciever opens message to read contents' do
      login_as(receiver, scope: :user, name: 'reciever', email: 'sender1@mail.com')
      visit mailbox_inbox_path
      click_on 'View'
      expect(page).to have_content 'Lorem ipsum...'
    end
  end
end
