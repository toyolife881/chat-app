FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    # users.rbのFactoryBotとアソシエーションがある
    # messageのインスタンスが生成されたと同時に、関連するuserのインスタンスも生成される
    association :user
    # rooms.rbのFactoryBotとアソシエーションがある
    # messageのインスタンスが生成されたと同時に、関連するroomのインスタンスも生成される
    association :room

    # インスタンスがbuildされた後に、処理を実行
    after(:build) do |message|
      # io: File.openで設定したパスのファイル(public/images/test_image.png)を、test_image.pngというファイル名で保存
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end