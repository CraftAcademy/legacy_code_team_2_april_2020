feature 'user can view deleted message' do
  let(:user) { create(:user, email: "user@gmail.com") }
  let(:sender) { create(:user, name: 'dora', email: "sender@gmail.com") }
  before do
    login_as(sender, scope: :user)
    visit root_path
    sender.send_message(user, 'Lorem ipsum.', 'Subject')
    click_on 'Logout'
  end

  describe 'user can delete message' do
    before do
      login_as(user, scope: :user)
      visit root_path
    end

    it 'remove message to trash' do
      visit mailbox_inbox_path
      test = find(class: 'media-body')
      expect(test).to have_content 'Lorem ipsum.'
      click_on 'View'
      accept_alert do
        click_link ('Move to trash')
        # click_button('OK')
      end
    end

    it 'message deleted in trash' do
      visit mailbox_trash_path
      content = find(class: 'media-body')
      expect(content).to have_content 'Lorem ipsum.'
    end
  end
end


    # Given(/^I am logged in as "([^"]*)"$/) do |name|
    #     @user = User.find_by(name: name)
    #     login_as(@user, scope: :user)
    # end

    #   And(/^I send a mail to "([^"]*)"$/) do |name|
    #     @receiver = User.find_by(name: name)
    #     @user.send_message(@receiver, 'Lorem ipsum...', 'Subject')
    #   end

    #   And(/^I should have "([^"]*)" messages$/) do |expected_count|
    #     count = @receiver.mailbox.inbox.count
    #     expect(count).to eq expected_count.to_i
    #     click_on "Logout"
    #     expect(page).to have_content "Signed out successfully."
    #   end
    
    #   And(/^I am logged in as "([^"]*)"$/) do |name|
    #     visit root_path
    #     login_as(@receiver, scope: :user)
    #   end

    #   And(/^I send a mail to "([^"]*)"$/) do |name|
    #     @receiver.reply_to_conversation(@user, 'Lorem ipsum...', 'Subject')
    #   end

    # end
    #     # Then(/^I should have "([^"]*)" messages$/) do |expected_count|
    #     #   count = @user.mailbox.inbox.count
    #     #   expect(count).to eq expected_count.to_i
    #     # end
    #     it 'receiver should have 1 new message' do
    #       count = @user.mailbox.inbox.count
    #       expect(count).to eq 1
    #     end




