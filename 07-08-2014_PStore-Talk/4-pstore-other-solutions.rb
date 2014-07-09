# Inspired by: http://www.reddit.com/r/ruby/comments/1w58w0/persisting_data_with_pstore/

# Taken from: http://stackoverflow.com/a/20560834/1539293
  # PStore - Very simple persistent hash. Handles marshaling for you, so you can store trees of ruby objects. Appears to be pure ruby solution.
  # SDBM - C-based key/value store. Ruby ships with the entire source so it should be portable across platforms. Simple string keys and values only.
  # GDBM - Another string only key/value store. Uses GNU dbm. Its "enumerable" so its a little more hash-like. Possibly not very portable.
  # DBM - Uses the DBM headers available on the platform ruby was compiled on, so it could be one of several DBM implementations (read: not portable). Yet another string only key/value store. That's 3. Unlike GDBM though this one will allow you to store non-string values and silently ruin them by calling #to_s or #inspect.

require 'benchmark'
require 'gdbm'
require 'pstore'
 
File.delete "test.pstore" if File.exist? "test.pstore"
 
pstore = PStore.new "pstore-data/4-pstore-other-solutions.pstore"
gdbm = GDBM.new "pstore-data/4-pstore-other-solutions.gdbm", 0666, GDBM::NEWDB
a = Array.new(1000, 1)
 
Benchmark.bmbm do |bm|
  bm.report "pstore write" do
    10000.times do
      pstore.transaction do
        pstore["some_array"] = a
      end
    end
  end

  bm.report "gdbm write" do
    10000.times do
      gdbm["some_hash"] = Marshal.dump(a)
    end
  end
 
  bm.report "pstore read" do
    10000.times do
      pstore.transaction do
        pstore["some_array"]
      end
    end
  end
 
  bm.report "gdbm read" do
    10000.times do
      Marshal.load gdbm["some_hash"]
    end
  end
end
