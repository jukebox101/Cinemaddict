# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Review.destroy_all
Movie.destroy_all

user1 = User.create(username: "jeff", first_name: "Jefferson", last_name: "Huisa", password: "test", email: "jeff@gmail.com")
user2 = User.create(username: "Lilly", first_name: "Leonora", last_name: "Squires", password: "test1", email: "lilly@gmail.com")
user3 = User.create(username: "johnD", first_name: "John", last_name: "Doe", password: "test2", email: "johnD@gmail.com")

movie1 = Movie.create(title: "Avatar", genre: "Action", description: "Cool blue people", rating: "PG-13")
movie2 = Movie.create(title: "The Revenant", genre: "Drama", description: "sustains life-threatening injuries from a brutal bear attack.", rating: "R")
movie3 = Movie.create(title: "The Hangover", genre: "Comedy", description: "All three films follow the misadventures", rating: "R")
movie4 = Movie.create(title: "The Terminator", genre: "Action", description: "Skynet goes live", rating: "R")
movie5 = Movie.create(title: "Toy Story 1", genre: "Childrens", description: "Story about toys", rating: "G")

review1 = Review.create(description: "Great movie", user_id: user1.id, movie_id: movie1.id, time_posted: Time.now)
review2 = Review.create(description: "Not a good movie", user_id: user3.id, movie_id: movie3.id, time_posted: Time.now)
review3 = Review.create(description: "Watching again", user_id: user3.id, movie_id: movie2.id, time_posted: Time.now)
review4 = Review.create(description: "Awesome movie", user_id: user2.id, movie_id: movie5.id, time_posted: Time.now)
