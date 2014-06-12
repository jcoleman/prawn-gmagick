require "mkmf"

find_header "magick_wand.h",
  "/app/vendor/graphicsmagick/include/GraphicsMagick/wand"

pkg_config("GraphicsMagickWand")
create_makefile("image")
