# == Schema Information
#
# Table name: channel_voip
#
#  id              :bigint           not null, primary key
#  sipuser         :string           not null
#  sipsecret       :string           not null
#  websocket_port  :string           default("5063")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :integer          not null
#
# Indexes
#
#  index_channel_voip_on_sipuser  (sipuser) UNIQUE
#

class Channel::Voip < ApplicationRecord
  include Channelable

  self.table_name = 'channel_voip'
  EDITABLE_ATTRS = [:sipuser, :sipsecret, :websocket_port, { provider_config: {} }].freeze

  validates :sipuser, presence: true, uniqueness: true
  # before_save :validate_provider_config

  def name
    'Voip'
  end

end
