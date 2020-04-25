# frozen_string_literal: true

feature 'User can reply to a message' do
    let(:sender) { create(:user, email: 'sender@mail.com') }
    let(:receiver) { create(:user, name: 'reciever', email: 'sender1@mail.com') }
    before do
      sender.send_message(receiver, 'Lorem ipsum...', 'Subject')
      login_as(@receiver, scope: :user, name: 'reciever', email: 'sender1@mail.com')
      visit mailbox_inbox_path
      click_on 'View'
    end
    it 'user/receiver replies to message' do
    #   receiver.reply_to_conversation(conversation, 'Lorem ipsum...', 'Subject')
        fill_in 'message[body]', with: 'Nullam interdum auctor ipsum, cursus luctus ex ullamcorper ac.'
      click_on 'Reply'
      expect(page).to have_content 'Your reply message was successfully sent!'
      click_on 'Logout'
    end
    it 'sender should have 1 new message in the inbox' do
      count = sender.mailbox.inbox.count
      expect(count).to eq 1
    end
    it "sender receives user's message" do
      login_as(sender, scope: :user, name: 'sender', email: 'sender@mail.com')
      visit mailbox_inbox_path
      expect(page).to have_content 'Nullam interdum'
    end
end

#   given(/^I am logged in as "([^"]*)"$/) do |name|
#     @user = User.find_by(name: name)
#     login_as(@user, scope: :user)
#   end

#   And(/^I send a mail to "([^"]*)"$/) do |name|
#     @receiver = User.find_by(name: name)
#     @user.send_message(@receiver, 'Lorem ipsum...', 'Subject')
#   end

#   Then(/^I should have "([^"]*)" messages$/) do |expected_count|
#     count = @receiver.mailbox.inbox.count
#     expect(count).to eq expected_count.to_i
#   end

#   Given(/^I am logged in as "([^"]*)"$/) do |name|
#     @receiver = User.find_by(name: name)
#     login_as(@receiver, scope: :user)
#   end

#   And(/^I reply to a mail to "([^"]*)"$/) do |name|
#     @sender = User.find_by(name: name)
#     @receiver.reply_to_conversation(@sender, 'Nullam interdum auctor ipsum,', 'Subject')
#   end

#   Then(/^I should have "([^"]*)" messages$/) do |expected_count|
#     count = @user.mailbox.inbox.count
#     expect(count).to eq expected_count.to_i
#   end
# end
