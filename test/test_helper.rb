$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))

# Test runner libs
require 'minitest/autorun'

# Top::Bunny::Sensu libs
require 'top/bunny/sensu'
