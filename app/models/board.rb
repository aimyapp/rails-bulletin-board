# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  name       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Boardのバリデーションクラス 
  class Board < ApplicationRecord
    # dependent: :delete_all 掲示板削除したら紐づくコメント、タグも削除の必要があるための設定
    has_many :comments, dependent: :delete_all
    # 多対多のテーブルの紐づけの場合は中間テーブルと中間テーブル先で紐づくテーブルの設定が必要
    has_many :board_tag_relations, dependent: :delete_all
    has_many :tags, through: :board_tag_relations
    # presence: not null 制約
    validates :name, presence: true, length: { maximum: 10 }
    validates :title, presence: true, length: { maximum: 30 }
    validates :body, presence: true, length: { maximum: 1000 }
  end
