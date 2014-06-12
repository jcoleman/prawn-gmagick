require "mkmf"

found = find_header "Magick++.h",
  "/app/vendor/graphicsmagick/include/GraphicsMagick",
  "/usr/local/Cellar/graphicsmagick/1.3.19_1/include/GraphicsMagick"

unless found
  throw "Could not find wand/magick_wand.h"
end

pkg_config("GraphicsMagickWand")
create_makefile("image")
