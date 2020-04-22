feature 'user can sign up and log in' do
  let(:user) {FactoryBot.create(:user, email: "gittan@gmail.com")}
  let(:user2) {FactoryBot.create(:user)}
  before do
    visit root_path
  end
  
  
  context 'successfully created a new account' do
    before do
      click_on "Sign up"
    end
    it 'User should see success message' do
      fill_in "Name", with: user.name
      fill_in "Email", with: "mufflon@gmail.com"
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password_confirmation
      click_on "Create"
      expect(page).to have_content "You have signed up successfully"
    end
  end
    
  context 'user successfully logged in' do
    before do
      click_on "Login"
    end
    it "user should be signed in" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"
      expect(page).to have_content "Signed in successfully"
    end

  end
    

# SAD PATH

  context 'couldnt created a new account' do
    before do
      click_on "Sign up"
    end
    it 'User should see error message' do
      fill_in "Name", with: user.name
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: "123456"
      click_on "Create"
      expect(page).to have_content "Password confirmation doesn't match"
    end
  end

  context 'user could not log in' do
    before do
      click_on "Login"
    end
    it "should get error message" do
      fill_in "Email", with: user.email
      fill_in "Password", with: ""
      click_on "Log in"
      expect(page).to have_content "Invalid Email or password."
    end
  end

end