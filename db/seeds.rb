print "Pupulating database with 999 things..."
1.upto 999 do |id|
  Thing.create! id: id, name: "thing-#{"%03d" % id}"
end
puts " done"
