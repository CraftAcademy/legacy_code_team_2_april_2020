# frozen_string_literal: true

feature 'User can reply to a message' do
  let(:sender) { create(:user, email: 'sender@mail.com') }
  let(:receiver) { create(:user, name: 'reciever', email: 'sender1@mail.com') }
  before do
    sender.send_message(receiver, 'Lorem ipsum...', 'Subject')
    login_as(receiver, scope: :user, name: 'reciever', email: 'sender1@mail.com')
    visit mailbox_inbox_path
    click_on 'View'
  end
  it 'user/receiver replies to message' do
    fill_in 'Reply Message', with: 'Nullam interdum auctor ipsum, cursus luctus ex ullamcorper ac.'
    click_on 'Reply'
    expect(page).to have_content 'Your reply message was successfully sent!'
    count = receiver.mailbox.inbox.count
    expect(count).to eq 1
  end

#   describe 'checking sender has received the reply' do
#     before do
#       login_as(sender, scope: :user, name: 'sender', email: 'sender@mail.com')
#       visit mailbox_inbox_path
#       #   click_on 'View'
#     end

#     it 'sender should have 1 new message in the inbox' do
#       count = sender.mailbox.inbox.count
#       expect(count).to eq 1
#     end
#     it "sender receives user's message" do
#       expect(page).to have_content 'Nullam interdum'
#     end
#   end
end
