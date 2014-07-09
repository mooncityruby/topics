# https://robm.me.uk/ruby/2014/01/25/pstore.html
# YAML::Store uses YAML as its data format
require "yaml/store"

store = YAML::Store.new("pstore-data/3-pstore-yaml.yml")

store.transaction do
  store[:foo] = [ 1, 2, 3, [4, 5, 6] ]
end
p store.transaction { store[:foo] }

store = PStore.new("pstore-data/3-pstore-yaml.pstore")
store.transaction do
  store[:foo] = [ 1, 2, 3, [4, 5, 6] ]
end
p store.transaction { store[:foo] }

# Pro: Human Readable
# Con: A tad slower

# Also, it should be noted you can probably use whatever format you enjoy. (i.e JSON, XML, etc...)
