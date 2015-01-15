require 'sqlite3'

# Opening the database
db = SQLite3::Database.new "./share.sqlite"

#Command line options
puts "
	Whats do you want to do?
		1 - Select count of records
		2 - Select last 10 records"

response = gets.chomp

#SQL commands
option1 = db.execute ("select count(*) from stations")
option2 = db.execute ("select * from stations order by 1 desc limit 10")

#Case commands
case response
when "1"
	puts option1
when "2"
	option2
end