# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :string           not null
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text             not null
#  bonus      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :lyrics, :name, :ord, presence: true
  # validates :bonus, default: :false
  validates :bonus, inclusion: { in: [true, false] }
  validates :ord, uniqueness: { scope: :album_id }

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album

  has_one :band,
    through: :album,
    source: :band

end
