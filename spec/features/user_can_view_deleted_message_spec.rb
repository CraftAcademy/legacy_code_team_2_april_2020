@javascript


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
      visit mailbox_inbox_path
      test = find(class: 'media-body')
      expect(test).to have_content 'Lorem ipsum.'
      click_on 'View'
      click_on 'Move to trash'
    end

    # it 'remove message to trash' do
    #   visit mailbox_inbox_path
    #   test = find(class: 'media-body')
    #   expect(test).to have_content 'Lorem ipsum.'
    #   click_on 'View'
      # accept_alert do
      # click_on 'Move to trash'
        # click_button('OK')
      # end
    # end

    it 'message deleted in trash' do
      visit mailbox_trash_path
      count = user.mailbox.trash.count
      expect(count).to eq 1
      # content = find(class: 'media-body')
      # expect(body).to have_content 'Lorem ipsum.'
    end
  end
end



# Background
#   Given following users exists
#     | name   | email             | password |
#     | Jenny  | jenny@ranom.com   | password |
#     | Dora | daniel@random.com | password |


# Scenario Deleting a mail
#   Given I am loggedin as "Dora"
#   And I send a mail to "Jenny"
#   And I click on the link "Logout" 
#   Given I am loggedin as "Jenny"
#   And I reply a mail to "Dora"


#     Given(/^I am logged in as "([^"]*)"$/) do |name|
#         @user = User.find_by(name: name)
#         login_as(@user, scope: :user)
#     end

#     And(/^I send a mail to "([^"]*)"$/) do |name|
#       @receiver = User.find_by(name: name)
#       @user.send_message(@receiver, 'Lorem ipsum...', 'Subject')
#     end

#     And('I click on the logout link') do
#       click_on "Logout"
#     end

#     Given(/^I am logged in as "([^"]*)"$/) do |name|
#       visit root_path
#       login_as(@receiver, scope: :user)
#     end

#     And(/^I send a mail to "([^"]*)"$/) do |name|
#       @receiver.reply_to_conversation(@user, 'Lorem ipsum...', 'Subject')
#     end

    
#     Then(/^I should have "([^"]*)" messages$/) do |expected_count|
#       count = @user.mailbox.inbox.count
#       expect(count).to eq expected_count.to_i
#     end
    
    # And(/^I should have "([^"]*)" messages$/) do |expected_count|
    #   count = @receiver.mailbox.inbox.count
    #   expect(count).to eq expected_count.to_i
    #   click_on "Logout"
    #   expect(page).to have_content "Signed out successfully."
    # end









