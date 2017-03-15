names = [Faker::Name.first_name, Faker::Name.first_name, Faker::Name.first_name, Faker::Name.first_name, "Sami"]
names.each do |name|
  user = User.create(name: name, email: "#{name}@email.com", password: "password", password_confirmation: "password")
  3.times do
    Message.create(body: Faker::Lorem.paragraph, user_id: user.id, created_at: (1..50).to_a.sample.hours.ago)
  end
end
