require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'user db table' do
        it { is_expected.to have_db_column :name }
        it { is_expected.to have_db_column :email }
    end
end 
