class Message < ApplicationRecord
  # 1つのメッセージは、1つのチャットルームに存在
  belongs_to :room
  # 1つのメッセージは、1人のユーザーから送信
  belongs_to :user

  has_one_attached :image

  # unlessオプション / was_attached?メソッド・・・メソッドの返り値がfalseならばバリデーションの検証を行う
  # 画像が存在しなければテキストが必要、画像があればテキストは不要
  validates :content ,presence: true, unless: :was_attached?

  def was_attached?
    # 画像があればtrue、なけらばfalseを返す
    self.image.attached?
  end
end


