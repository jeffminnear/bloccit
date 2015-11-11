include RandomData

# Create a Unique Post
Post.find_or_create_by(title: 'My Super Special Unique Post') do |post|
  post.body = "This is the awesomely singular body of my super special unique post!"
end
Post.find_or_create_by(title: 'Another Unique Post') do |post|
  post.body = "The text in this body doesn't exist anywhere else."
end

# Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post:  posts.sample,
    body:  RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
