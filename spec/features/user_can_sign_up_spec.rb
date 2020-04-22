feature 'user can sign up for an account' do
  before do
    visit root_path
    # click_on "Sign up"
    create(:user)
    fill_in "Email", with: user[:email]
    fill_in "Password", with: user[:password]
    click_on "Log in"
    
  end

    it 'User should see success message' do
      expect(page).to have_content "Signed in successfully"
    end

  # before do
  #   visit root_path
  #   click_on "Sign up"
  # end

  # context 'successfully created a new account' do
    
  #   it 'User should see success message' do
  #     fill_in "Name", with: "Legacy Man"
  #     fill_in "Email", with: "legacyman@gmail.com"
  #     fill_in "Password", with: "Corona2020"
  #     fill_in "Password confirmation", with: "Corona2020"
  #     click_on "Create"
  #     expect(page).to have_content "You have signed up successfully"
  #   end
  # end

  # context "[Sad Path] User misses to fill in form" do
 
  #   it 'User should see error message if password is missing' do
  #     fill_in "Name", with: "Holy Smoke"
  #     fill_in "Email", with: "HolySmoke@hotmail.com"
  #     click_on "Create"
  #     expect(page).to have_content "Password can't be blank"
  #   end

  #   it 'User should see error message if password doesnt match' do
  #     fill_in "Name", with: "Yo Lo"
  #     fill_in "Email", with: "yooloo@gmail.com"
  #     fill_in "Password", with: "Corona2020"
  #     fill_in "Password confirmation", with: "corona2020"
  #     click_on "Create"
  #     expect(page).to have_content ("error prohibited for this user being saved" && "Password confirmation doesn't match Password")
  #   end
  
  # end

end