# == Schema Information
#
# Table name: feedstocks
#
#  id              :integer          not null, primary key
#  biomass_type_id :integer
#  harvest_id      :integer
#  amount          :float
#  unit            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  owner_id        :integer
#
# Indexes
#
#  index_feedstocks_on_biomass_type_id  (biomass_type_id)
#  index_feedstocks_on_harvest_id       (harvest_id)
#  index_feedstocks_on_owner_id         (owner_id)
#

class Feedstock < ApplicationRecord
  has_paper_trail

  belongs_to :owner, class_name: 'User'
  belongs_to :biomass_type
  belongs_to :harvest


end
