# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  subject { FactoryBot.build_stubbed(:user) }
  context 'fields' do
    ## Database authenticatable
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:username).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    ## Recoverable
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    ## Trackable
    it { is_expected.to have_db_column(:sign_in_count).of_type(:integer).with_options(default: 0) }
    it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:inet) }
    it { is_expected.to have_db_column(:last_sign_in_ip).of_type(:inet) }
    ## Confirmable
    it { is_expected.to have_db_column(:confirmation_token).of_type(:string) }
    it { is_expected.to have_db_column(:confirmed_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:unconfirmed_email).of_type(:string) }
    ## Lockable
    it { is_expected.to have_db_column(:failed_attempts).of_type(:integer).with_options(default: 0) }
    it { is_expected.to have_db_column(:unlock_token).of_type(:string) }
    it { is_expected.to have_db_column(:locked_at).of_type(:datetime) }
    ## Dates
    it { is_expected.to have_db_column(:deleted_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    # admin/employee
    it { is_expected.to have_db_column(:admin).of_type(:boolean).with_options(default: false) }

    it { is_expected.to have_db_index(:confirmation_token).unique }
    it { is_expected.to have_db_index(:email).unique }
    it { is_expected.to have_db_index(:reset_password_token).unique }
    it { is_expected.to have_db_index(:unlock_token).unique }
    it { is_expected.to have_db_index(:username).unique }
    it { is_expected.to be_paranoid }
  end

  describe 'associations' do
    # it { is_expected.to have_many(:user_notification_subscriptions) }
  end

  describe 'callbacks' do
  end

  describe 'validations' do
    it { should validate_email_format_of(:email).with_message('format is not valid') }
    # it { is_expected.to callback(:activate_beta_code).after(:create) }
  end
end
