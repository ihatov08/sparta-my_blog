# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    # t.string   "title"
    # t.text     "body"
    # t.string   "category"

Author.create(name: '八幡平三郎', description: "八幡平のブロガーです。毎日更新。", image_url: "http://heaaart.com/heartadmin/wp-content/uploads/2015/04/49716-1.png", email: "hachiman@saburo.com", password: "password")

Author.create(name: '安比呂子', description: "安比高原のブロガーです。毎日更新。", image_url: "http://stat.profile.ameba.jp/profile_images/20090930/13/b7/e3/j/o031703171254285765683.jpg", email: "appi@noko.com", password: "password")

Author.create(name: 'ねこひろし', description: "ねこひろしです。毎日更新。", image_url: "http://dok-ryuukouhassin.blog.so-net.ne.jp/_images/blog/_504/dok-ryuukouhassin/E381ADE38193p2.jpg", email: "neko@hiroshi.com", password: "password")


100.times do |index|
  Post.create(title: "#{index}回目の投稿", body: "#{index}回目の投稿です。", category: "#{index}カテゴリ", author_id: rand(3) + 1 )
end