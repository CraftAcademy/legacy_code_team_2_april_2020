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

    it 'deleted message shows up in trashbox' do
      visit mailbox_trash_path
      count = user.mailbox.trash.count
      expect(count).to eq 1
    end
  end
end


