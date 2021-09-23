# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seeding Physician"
physician1 = Physician.create(user_name:'Anthony S',last_name: 'Fauci', title: 'M.D., NIAID Director', 
      image: 'https://www.niaid.nih.gov/sites/default/files/styles/large/public/fauci-advisory-council.jpg?itok=_NxpW53z',
       pone_number:'2152458873')

 physician2 =  Physician.create(user_name:'Dr. Umar', last_name: 'Farooq', title: 'MD Internal Medicine',
        image: 'https://photos.healthgrades.com/img/prov/X/X/Y/XXYJN_w120h160_v58132.jpg',
        pone_number:'2156387400'  )

        puts "seeding Patient"
  patient1 = Patient.create(user_name: 'Jhon', last_name: 'Souza', email: 'jhon.souza@flatironschool.com', phone_number: '2096678536',
        image: 'https://lh3.googleusercontent.com/-oQJZLLWqMwM/AAAAAAAAAAI/AAAAAAAACxw/R4rx3aXDmKo/photo.jpg'
    )

  patient2 = Patient.create(user_name: 'Alvee', last_name: 'Akand', email: 'alvee.akanda@flatironschool.com',
        phone_number: '2096678458', image: 'https://avatars.githubusercontent.com/u/9080771?v=4')

puts "seeding login"
 user1 = Login.create(user_name: 'Jhon', password: 'Jhon123')

 user2 = Login.create(user_name: 'Alvee', password: 'Alvee321')


 puts "seeding Appointment"
  appointment1 = Appointment.create!( appointments_date: Time.now, appointments_time: Time.now , patient_id: patient1.id, name_patient: patient1.user_name, 
  last_namePatient:patient1.last_name, physician_id: physician1.id,name_physician:physician1.user_name, last_namePhysician:patient1.last_name,
   created_at: Time.now, updated_at: Time.now )
  
  
  appointment2 = Appointment.create!( appointments_date: Time.now, appointments_time: Time.now , patient_id:patient2.id, name_patient: patient2.user_name,last_namePhysician: patient2.last_name, physician_id: physician2.id ,  
  name_physician: physician2.user_name, appointments_date: Time.now,
  created_at: Time.now, updated_at: Time.now)
  
  
  puts "seeding Reviews"
  review1 = Review.create!(comment: 'Good service', rating: '5', appointments_id: appointment1.id,
  created_at:Time.now , updated_at: Time.now )
  review2 = Review.create!(comment: 'bad service', rating: '3', appointments_id: appointment2.id,
  created_at:Time.now , updated_at: Time.now )

puts "End seed" 