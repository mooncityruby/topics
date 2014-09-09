##
# If Duck-typed Polymorphism handles the case of nothing by doing
# something differently, what about the case in which I want to
# do strictly nothing?

# status is either nil or a Process::Status object
unless [0,172].include?(status && status.exitstatus)
  raise ArgumentError,
    "Command exited with status #{status.try(:exitstatus)}"
end

##
# NullObject Pattern
#
# A special case of the Special Case pattern: handle case of
# nothing with a no-op or chain of no-ops.

status ||= OpenStruct.new(exitstatus: 0)
unless [0,172].include?(status.exitstatus)
  raise ArgumentError,
    "Command exited with status #{status.exitstatus}"
end

##
# A basic Null Object

class NullObject
  def method_missing(*args, &block)
    self
  end

  def nil?; true; end
end

def Maybe(value)
  value.nil? ? NullObject.new : value
end

##
# This is exceptionally useful in output and logging examples

if options[:out]
  options[:out] << output
end

# becomes...

Maybe(options[:out]) << output

##
# Instead of constantly dumping logfiles you never asked for...

def initialize(logger=NullObject.new)
  @logger = logger
end
