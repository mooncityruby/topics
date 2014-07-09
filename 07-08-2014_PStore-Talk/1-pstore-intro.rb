# "PStore implements a file based persistence mechanism based on a Hash. 
# User code can store hierarchies of Ruby objects (values) into the data store file by name (keys). 
# An object hierarchy may be just a single object. 
# User code may later read values back from the data store or even update data, as needed."
# Taken from: http://www.ruby-doc.org/stdlib-2.1.2/libdoc/pstore/rdoc/PStore.html
require "pstore"

store = PStore.new("pstore-data/1-pstore-intro.pstore")

# Reading and writing has to take place inside of a transaction. 
# Transactions ensure data is never written in an incomplete or corrupted state
# Unless the operating system (and the underlying hardware) raises an unexpected I/O error.
store.transaction do
  p "Printing before assignment: #{store[:foo]}"
  store[:foo] = "bar"
  p "Printing after assignment: #{store[:foo]}"
end
