$LOAD_PATH.unshift  File.join(__dir__, "lib")

require "rake/testtask"
require "rake/extensiontask"
require "mini_portile"

task "default" => :test

Rake::ExtensionTask.new "image" do |ext|
  ext.lib_dir = "lib/prawn/gmagick"
end

Rake::TestTask.new do |t|
    t.pattern = "test/**/*_test.rb"
end
task "test" => :compile


task :graphicsmagick do
  recipe = MiniPortile.new("graphicsmagick", "1.3.19")
  recipe.files = ["ftp://ftp.icm.edu.pl/pub/unix/graphics/GraphicsMagick/1.3/GraphicsMagick-1.3.19.tar.bz2"]
  checkpoint = ".#{recipe.name}-#{recipe.version}.installed"

  unless File.exist?(checkpoint)
    recipe.cook
    touch checkpoint
  end

  recipe.activate
end

task :compile => [:graphicsmagick]


desc "Generate an example PDF using the images in test/fixtures"
task "example" do
$LOAD_PATH.unshift "./lib"
  require "prawn/gmagick"
  doc = Prawn::Document.new margin: 0
  files = %w(rgb.gif rgb_alpha.gif rgb.jpg cmyk.jpg rgb.pdf rgb_alpha.pdf rgb.png rgb_alpha.png rgb.tiff rgb.bmp)
  files.each do |filename|
    start_time = Time.now
    doc.start_new_page unless filename == files.first

    doc.fill_color "00FF11"
    doc.fill_rectangle [0, 11 * 72], 400, 400
    doc.fill_color "000000"
    file_path = File.join __dir__, "test", "fixtures", filename
    doc.text file_path
    doc.image file_path, height: 200
    puts "Added #{file_path} in #{Time.now-start_time} seconds"
  end
  doc.render_file "example.pdf"
end
