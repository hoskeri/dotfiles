begin
  require 'wirble'

  Wirble.init
  Wirble.colorize
rescue LoadError
end
