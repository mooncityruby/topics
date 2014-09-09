##
# Iterator Pattern
#
# Goal: provide a way to access the elements of an aggregate object
# sequentially without exposing its underlying representation.

##
# Behold! Ruby's Arrayification operator

Array([1,2,3]) # => [1, 2, 3]
Array("foobar") # => ["foobar"]
Array(nil) # => []

##
# Even when you're performing trivial operations on an object,
# encapsulating a potentially missing object in a collection
# makes your code a lot more confident.

if options[:out]
  options[:out] << output
else
  # NOOP
end

# becomes...

Array(options[:out]).each do |out_pipe|
  out_pipe << output
end

##
# No more one-or-error patterns!
