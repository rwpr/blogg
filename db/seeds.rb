require_relative '../config/environment'

5.times do
  Tag.create tag_name: Faker::Address.state
end

5.times do
  Post.create post_name: Faker::Name.name,
              post_desc: Faker::Hacker.say_something_smart
end

5.times do
  PostTag.create post_id: Faker::Number.between(0,5),
                 tag_id: Faker::Number.between(0,5)
end
