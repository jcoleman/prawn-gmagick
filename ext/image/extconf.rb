require 'pathname'
require "mkmf"

if ENV['BUNDLE_CONFIG']
  bundle_config_path = ENV['BUNDLE_CONFIG']
  build_dir = Pathname.new(bundle_config_path).parent.parent
  find_header "wand/magick_wand.h", build_dir.join("vendor/graphicsmagick/include/GraphicsMagick")

  find_library 'libGraphicsMagick.a', 'InitializeMagick', build_dir.join("vendor/graphicsmagick/lib")
  # /app/vendor/graphicsmagick/lib
  # libGraphicsMagick++.a  libGraphicsMagick.la  libGraphicsMagick++.la  libGraphicsMagickWand.a  libGraphicsMagickWand.la  pkgconfig
  # libGraphicsMagick.a  libGraphicsMagick++.a  libGraphicsMagick.la  libGraphicsMagick++.la  libGraphicsMagickWand.a  libGraphicsMagickWand.la  pkgconfig
  # /app/vendor/graphicsmagick/lib
  # libGraphicsMagickWand.a:
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
