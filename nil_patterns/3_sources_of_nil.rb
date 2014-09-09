##
# Missing hash keys

h = {}
h['fnord'] # => nil

##
# Or ARE they missing? #whackanil

h = {'fnord' => nil}
h['fnord'] # => nil

##
# Empty methods return nil by default

def empty
  # TODO
end
empty # => nil

##
# Yielded from an if statement that fails with no else block

result = if (2 + 2) == 5
           "uh-oh"
         end
result # => nil

##
# Yielded from a case statement with no matching when block

type = case :foo
       when String then "string"
       when Integer then "integer"
       end
type # => nil

##
# When a local variable is only assigned in an if statement (that failed)
# with no else block.... #whackanil

if (2 + 2) == 5
  tip = "follow the white rabbit"
end
tip # => nil

##
# Unset (aka typoed instance variables)

@i_can_has_spelling = true
puts @i_can_haz_speling # => nil

##
# Some Ruby methods even return it to indicate failure!

[1, 2, 3].detect{|n| n == 5} # => nil

##############################################################


##
# Can YOU see where the nil is coming from?

require 'yaml'
SECRETS = File.exist?('secrets.yml') && YAML.load_file('secrets.yml')

def get_password_for_user(username=ENV['USER'])
  secrets = SECRETS || @secrets
  entry = secrets && secrets.detect{|entry| entry['user'] == username}
  entry && entry['password']
end

get_password_for_user # => nil




##
# secrets.yml file could exist, but contain no entries...
#
# maybe the ENV['USER'] variable wasn't set...
#
# maybe @secrets was nil...
#
# maybe @secrets wasn't nil, but it just didn't contain an entry for
# the current user...
#
# We could never definitively know!
