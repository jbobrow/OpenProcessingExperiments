# Depends on https://github.com/vorgos/QuickGrab
# Install quickgrab and make sure it's in your path
 
sketchname = ARGV[0]
unless sketchname
  puts "\tusage: ruby capture_sketch.rb <sketch_name>"
  exit 1
end
 
line = `ps x | grep #{sketchname}`
pid = line.split(" ").first.to_i
puts "saving #{sketchname}.png"
`quickgrab -pid #{pid} -file #{sketchname}.png`