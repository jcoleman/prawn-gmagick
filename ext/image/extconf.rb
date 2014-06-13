require 'pathname'
require "mkmf"

if ENV['BUNDLE_CONFIG']
  # puts "=-=-=-=-=-=-="
  # puts "Current working directory - #{Dir.pwd}"
  # puts "=-=-=-=-=-=-="
  # puts ENV.to_h
  # puts "=-=-=-=-=-=-="
  bundle_config_path = ENV['BUNDLE_CONFIG']
  # puts "bundle_config_path #{bundle_config_path}"
  # puts "=-=-=-=-=-=-="
  build_dir = Pathname.new(bundle_config_path).parent.parent
  # puts "Build dir: #{build_dir}"
  # puts "=-=-=-=-=-=-="
  # puts "Build dir entries: #{build_dir.entries}"
  # puts "=-=-=-=-=-=-="

  find_header "wand/magick_wand.h",
    build_dir.join("include/GraphicsMagick")
end

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
