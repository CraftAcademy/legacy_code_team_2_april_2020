require 'rails_helper'

feature 'check user db table' do
    let(:user) {FactoryBot.create(:user, email: "test@gmail.com")}
    
    describe User, type: :model do
        describe 'user db table' do
            it { is_expected.to have_db_column :name }
            it { is_expected.to have_db_column :email }
            it { is_expected.to have_db_column :encrypted_password }
        end

        describe 'Validations' do
            it { is_expected.to validate_presence_of :name }
            it { is_expected.to validate_presence_of :email }
            it { is_expected.to validate_presence_of :encrypted_password }
        end
        
        describe 'Factory' do
            it 'should have valid Factory' do
                expect(user).to be_valid
            end
        end
    end
end
