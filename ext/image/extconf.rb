require "mkmf"

found = find_header "magick_wand.h",
  "/app/vendor/graphicsmagick/include/GraphicsMagick/wand"

unless found
  throw "Could not find wand/magick_wand.h"
end

pkg_config("GraphicsMagickWand")
create_makefile("image")
