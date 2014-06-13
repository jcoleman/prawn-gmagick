require 'pathname'
require "mkmf"

puts "=-=-=-=-=-=-="
puts "Current working directory - #{Dir.pwd}"
puts "=-=-=-=-=-=-="
puts ENV.to_h
puts "=-=-=-=-=-=-="
build_dir = Pathname.new(ENV['BUNDLE_CONFIG']).parent.parent
puts "=-=-=-=-=-=-="
puts build_dir
puts "=-=-=-=-=-=-="
puts build_dir.entries
puts "=-=-=-=-=-=-="

# puts Dir.glob("/tmp/*")
# puts 'All possible directories'
# puts Dir.glob("/tmp/*")
# found = find_header "wand/magick_wand.h",
#   "/app/vendor/graphicsmagick/include/GraphicsMagick",
#   "/usr/local/Cellar/graphicsmagick/1.3.19_1/include/GraphicsMagick"
# unless found
#   throw "Could not find wand/magick_wand.h"
# end

pkg_config("GraphicsMagickWand")
create_makefile("image")
