feature 'User can send message'do
    let(:sender) { FactoryBot.create(:user, email: 'sender@factory.com', password: "12345678", password_confirmation: "12345678") }
    let!(:receiver) {FactoryBot.create(:user, name: 'Dora', email: 'momo@factory.com', password:"87654321", password_confirmation: "87654321") } 
    
    context 'with an existing account [Happy path]' do

        before do   
            login_as(sender, scope: :user)
            visit new_conversation_path
            select receiver.name, from: 'conversation[recipients][]'
            fill_in 'conversation[body]', with: 'text' 
            fill_in 'conversation[subject]', with: 'text'
            click_on 'Send Message'
        end

        it 'user should see a success message' do
            expect(page).to have_content 'Your message was successfully sent!'
        end  
    end

    context 'gets error message [Sad path]' do
        before do
            login_as(sender, scope: :user)
            visit new_conversation_path
        end
        
        it 'if no recipient is chosen' do
            fill_in 'conversation[body]', with: 'text' 
            fill_in 'conversation[subject]', with: 'text'
            click_on 'Send Message'
            expect(page).to have_content "Add at least one recipient"
        end
        
        it 'if no subject is added' do
            select "Dora", from: "conversation[recipients][]"
            fill_in 'conversation[body]', with: 'text' 
            click_on 'Send Message'
            expect(page).to have_content "Add a subject"
        end
        
        it 'if no text is added' do
            select "Dora", from: "conversation[recipients][]"
            fill_in 'conversation[subject]', with: 'text' 
            click_on 'Send Message'
            expect(page).to have_content "Add a message"
        end
    end
end