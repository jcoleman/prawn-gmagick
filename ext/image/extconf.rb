require 'pathname'
require "mkmf"

# if ENV['BUNDLE_CONFIG']
#   # dir_config("GraphicsMagickWand")
#   # find_library 'GraphicsMagickWand', 'InitializeMagick'
# 
#   bundle_config_path = ENV['BUNDLE_CONFIG']
#   build_dir = Pathname.new(bundle_config_path).parent.parent
#   gm_dir = build_dir.join "vendor/graphicsmagick"
# 
#   find_header "wand/magick_wand.h", gm_dir.join("include/GraphicsMagick")
#   unless find_library 'libGraphicsMagickWand.a', 'InitializeMagick', [gm_dir.join("lib")]
#     throw "Could not find_library in", gm_dir.join("lib")
#   end
# 
#   # -lGraphicsMagickWand -lGraphicsMagick
#   # /app/vendor/graphicsmagick/lib
#   # libGraphicsMagick++.a  libGraphicsMagick.la  libGraphicsMagick++.la  libGraphicsMagickWand.a  libGraphicsMagickWand.la  pkgconfig
#   # libGraphicsMagick.a  libGraphicsMagick++.a  libGraphicsMagick.la  libGraphicsMagick++.la  libGraphicsMagickWand.a  libGraphicsMagickWand.la  pkgconfig
#   # /app/vendor/graphicsmagick/lib
#   # libGraphicsMagickWand.a:
#   # 2014-06-17T18:24:40.380238+00:00 app[worker.1]: sidekiq 3.0.2 app [0 of 2 busy]: symbol lookup error: /app/vendor/bundle/ruby/2.1.0/bundler/gems/prawn-gmagick-1225fc7dea49/lib/image.so: undefined symbol: InitializeMagick
#   # undefined symbol: InitializeMagick
# end

# puts Dir.glob("/tmp/*")
# puts 'All possible directories'
# puts Dir.glob("/tmp/*")
# found = find_header "wand/magick_wand.h",
#   "/app/vendor/graphicsmagick/include/GraphicsMagick",
#   "/usr/local/Cellar/graphicsmagick/1.3.19_1/include/GraphicsMagick"
# unless found
#   throw "Could not find wand/magick_wand.h"
# end

puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "ENV - #{ENV.to_hash}"

puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "PKG_CONFIG_PATH IS - #{ENV['PKG_CONFIG_PATH']}"

puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "ROOT DIR IS - #{Dir.glob("/*")}"

puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "/app/vedor IS - #{Dir.glob("/app/vendor/*")}"

if ENV['BUNDLE_CONFIG']
  bundle_config_path = ENV['BUNDLE_CONFIG']
  build_dir = Pathname.new(bundle_config_path).parent.parent
  puts "build_dir - #{build_dir}"

  vendor_glob = "#{build_dir.join('vendor')}/*"
  puts "vendor_glob - #{vendor_glob}"
  puts "build dir vendor contents- #{Dir.glob(vendor_glob)}"

  puts "app dir contents- #{Dir.glob("/app/*")}"
end

unless pkg_config("GraphicsMagickWand")
  abort "GraphicsMagickWand could not be found."
end

create_makefile("image")

