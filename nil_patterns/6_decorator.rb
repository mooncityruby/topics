##
# Duck typing is NOT about
#
#   object.is_a?(String) # Are you a duck?
#   object.respond_to?(:to_sym) # Can you quack?
#
# Duck typing is about treating the object like a duck, and expecting
# it to complain otherwise.

##
# Often happens over switch statements,
# (Switch Smell http://c2.com/cgi/wiki?SwitchStatementsSmell)
# testing an object's type.
#
# Testing an object's respond-ability to a method (aka interface)
# IS testing its type in an object-oriented system.
#
# Note: #nil? is a type check; nil is a class too!

destination = case options[:out]
              when nil then "return value"
              when File then options[:out].path
              else options[:out].inspect
              end
@logger.info "Wrote to #{destination}"

##
# You can't always get rid of switch statements, but you can encapsulate
# them!
#
# Decorator Pattern
#
# Goal: attach additional responsibilities to an object dynamically;
# gluing feathers to a pig.

def cowsink(out)
  case out
  when File then out
  when nil then NullSink.new
  else GenericSink.new(out)
  end
end

class NullSink
  def path; "return value"; end
  def <<(*); end
end

require 'delegator'
class GenericSink < SimpleDelegator
  def path; "object: #{inspect}"; end
  # All other methods pass through
end

destination = cowsink(options[:out]).path
@logger.info "Wrote to #{destination}"
