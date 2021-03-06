# == Schema Information
#
# Table name: materials
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  mattype_code      :string(255)
#  default_unit_code :string(255)
#  parent_matcode    :string(255)
#  min_level         :decimal(8, 2)
#  low_level         :decimal(8, 2)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  owner_id          :integer
#  active            :boolean          default(TRUE)
#
# Indexes
#
#  index_materials_on_owner_id  (owner_id)
#

class Material < ApplicationRecord
  has_paper_trail

  belongs_to :owner, class_name: 'User'

  has_many :inventory_batches

  validates :name, presence: true

  COLOR = 'warning'
  ICON = 'archive'
end
