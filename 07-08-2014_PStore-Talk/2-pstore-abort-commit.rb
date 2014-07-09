# https://robm.me.uk/ruby/2014/01/25/pstore.html
# PStore provides a nifty transaction method for aborting changes.
require "pstore"

store = PStore.new("pstore-data/2-pstore-abort-commit.pstore")
store.transaction do
  store[:foo] = "bar"
  store.abort if true
end

# result will be nil because the previous transaction was aborted.
store.transaction do
  p store[:foo]
end


# PStore also provides a nifty transaction method for saving current progress.
store.transaction do
  store[:bar] = "foo"
  store.commit if true
  store[:baz] = "foobar"
end

# result will be foo because it happened before store.commit
p store.transaction { store[:bar] }

# result will be nil because it happened after store.commit
p store.transaction { store[:baz] }
# ^ are examples of how to retrieve data from a store.

# You can also implement the Hash#fetch.
p store.transaction { store.fetch(:nonexistent_key, "default value") }

