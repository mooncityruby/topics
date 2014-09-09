##
# nil is a valid value in some situations. In others, it may
# be unavoidable. But nil often wears too many hats, and we
# take advantage of that too readily.
#
# As often as we complain about receiving nil in our code,
# why would we pass the buck?
#
# Help your callers be confident in your library and in their
# own code as well by desperately trying to rid nil from
# your returns. Instead, pass a Special Object or Null 
# Object. Or even raise an error! Just don't pass nil.

##
# We've seen naming nil something else helps debug pesky
# NoMethodErrors.

##
# Duck typing isn't about asking. It's not even about telling!
# It's about blindly walking off the cliff, expecting
# everything to work out unless someone actually complains.
#
# Use this pattern to encapsulate special cases in your
# code into a dedicated object (or even NullObject) where you
# would otherwise have to check for nil.

##
# Use the Iterator Pattern to avoid one-or-error scenarios,
# and treat both the happy and sad paths as one happy
# collection!
#
# The point is, whether you want it to do "something" or
# "nothing", when you're given nothing, don't have your code
# dive off on a tangent.
