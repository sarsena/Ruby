require 'rubygems'
require 'mongo'
require 'google_drive'

connection = Mongo::Connection.new('localhost')
db = connection.db("inkers")
collection = db.collection("inkers")

docName = "Inker Directory"
session = GoogleDrive.login('pandaslammed@gmail.com', "steven1234")

docTitle = session.file_by_title(docName)

keyString = docTitle.resource_id()
keyArray = keyString.split(":")
key = keyArray[1]

ws = session.spreadsheet_by_key(key).worksheets[0]

rows = ws.rows(skip=1)
id = 0
rows.each_with_index { |row, id| 
	name = "#{row[0]} #{row[1]}"
	title = row[2]
	department = row[3]
	inker = { :name => name, :title => title, :department => department, :id => id }
	inkerExist = {:id => id}
	coll = collection.find(inkerExist).to_a
	if coll.empty? == true
		p "Inker doesnt Exists"
		insert = collection.insert(inker)
	else
		p "Inker already Exists"
		update = collection.update(inkerExist, inker)
	end
}





# coll.each { |inker| 
# 	p inker["name"]
# 	p inker["title"]
# 	p inker["department"]
# }

