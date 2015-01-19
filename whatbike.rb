require 'sqlite3'

# Opening the database
db = SQLite3::Database.new "./share.sqlite"

#Command line options
puts "
	Whats do you want to do?
		1 - Select count of records
		2 - Select last 10 records
		3 - Number of bikes since X date"

response = gets.chomp

if response == '3'
	puts "Enter the start date for # of bikes (YYYY-MM-DD)"
	startdate = gets.chomp
end

#SQL commands
option1 = db.execute ("select count(*) from stations")
option2 = db.execute ("select * from stations order by 1 desc limit 10")
option3 = db.execute ("select avg(nb_bikes) from stations where created > datetime(\'#{startdate}\')")

#Case commands
case response
when "1"
	puts "Database currently holds: #{option1} records"
when "2"
	option2.each do |x|
		puts x.join(" | ")
	end
when "3"
	option3 = option3.join
	puts "The average # of bikes since #{startdate}: #{option3}"

end