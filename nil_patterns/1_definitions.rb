##
# Design Pattern
#
# Systematically names, motivates, and explains a general design that addresses
# a recurring design problem in object-oriented systems. It describes the
# problem, the solution, when to apply the solution, and its consequences. It
# also gives implementation hints and examples. The solution is a general
# arrangement of objects and classes that solve the problem. The solution is
# customized and implemented to solve the problem in a particular context.

##
# Nil
#
# A ubiquitous, singleton instance of NilClass, able to receive a handful
# of messages, but ultimately used to represent the absence of a value. As
# any Rails developer will readily know, it is assigned object id '4'.

##
# Let's talk about how why nil is a potential (though not declarative) code
# smell, and a few patterns that will help
#   1. debugging nil
#   2. cleaning up nil-cases
#   3. refactoring nil out completely (in some cases)
