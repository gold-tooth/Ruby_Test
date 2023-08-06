desc "generate articles and comments"
task :generate_data, [:size] => :environment do |_name, args|
  args[:size].to_i.times() do
    article = Article.create(
      title: Faker::Mountain.name, 
      body: Faker::Lorem.sentence(word_count: 100), 
      status: ['public', 'private', 'archived'].shuffle.first
    )

    rnd = Random.new
    rnd.rand(10..100).times do
      article.comments.create(
        commenter: Faker::FunnyName.name,
        body: Faker::Lorem.sentence(word_count: 15),
        status: ['public', 'private', 'archived'].shuffle.first

    )
    end
  end
  puts "done"
end     