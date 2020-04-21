feature 'User can view start page' do
    before do
        visit root_path
    end

    it 'User should see the start page' do
    expect(page).to have_content 'Craft Academy Mailbox'
    end
end