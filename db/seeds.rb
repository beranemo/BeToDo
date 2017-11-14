Todo.delete_all
20.times do 
  Todo.create(title: Faker::Hobbit.character,
    notes: Faker::Lorem.paragraph,
    due_date: Faker::Date.between(6.days.ago, Date.today + 5.days),
    done: Faker::Boolean.boolean)
end
