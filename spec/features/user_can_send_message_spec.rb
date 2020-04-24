feature 'User can send message'do
    let(:sender) { FactoryBot.create(:user, email: 'sender@factory.com', password: "12345678", password_confirmation: "12345678") }
    let(:receiver) {FactoryBot.create(:user, name: 'Dora', email: 'momo@factory.com', password:"87654321", password_confirmation: "87654321", id: 1) } 
    
    context 'with an existing account [Happy path]' do
        #let(:recepient) { find(:select, from, options).find(:option, 1, options).select_option }

        before do   
            login_as(sender, scope: :user)
            visit new_conversation_path
            #binding.pry
            #select 1, from: 'select#conversation_recipients.form-control.chosen-select'
            select find('conversation[recipients][]').value, from: 'conversation[recipients][]'
            select :receiver, from: 'conversation[recipients][]'
            fill_in 'conversation[body]', with: 'text' 
            fill_in 'conversation[subject]', with: 'text'
            click_on 'Send Message'
            render 
        end

        it 'user should see a success message' do
            expect(page).to have_content 'Your message was successfully sent!'
        end

        it 'should have 1 new message in the inbox' do
            count = receiver.mailbox.inbox.count
            expect(count).to eq 1
        end
    end

    # context 'gets error message [Sad path]' do
    #     before do
    #         visit root_path
    #         click_on 'Login'
    #         fill_in "user[email]", with: sender.email
    #         fill_in "user[password]", with: sender.password
    #         click_on 'Log in'
    #         click_on 'Inbox'
    #         click_on 'Compose'
    #     end
        
    #     it 'if no recepient is chosen' do
    #         fill_in 'conversation[body]', with: 'text' 
    #         fill_in 'conversation[subject]', with: 'text'
    #         click_on 'Send Message'
    #         expect(page).not_to have_content "Your message was successfully sent!"
    #     end
        
    #     it 'if no subject is added' do
    #         select "Dora", from: "conversation[recipients][]"
    #         fill_in 'conversation[body]', with: 'text' 
    #         click_on 'Send Message'
    #         expect(page).not_to have_content "Your message was successfully sent!"
    #     end
        
    #     it 'if no text is added' do
    #         select "Dora", :from => "conversation[recipients][]"
    #         fill_in 'conversation[subject]', with: 'text' 
    #         click_on 'Send Message'
    #         expect(page).not_to have_content "Your message was successfully sent!"
    #     end
    # end
end