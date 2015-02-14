# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Article.create(title: 'Title00000000', text: 'text 00000000', color: 0)

# Names = "disk-feb-93", "disk-apr-93", "disk-jun-93", "disk-mar-94"
# seed_data/<name>/file-nn.dat, where nn [0,40]

#p(Dir.pwd)

#Kmsave.columns.each do |column|
#  puts "name: #{column.name}, type: #{column.type}"
#end

#name: id, type: integer
#name: disk_number, type: integer
#name: sector_id, type: integer
#name: sector_number_l, type: integer
#name: data_l, type: binary
#name: data_h, type: binary


$dsknum = 1
["disk-feb-93", "disk-apr-93", "disk-jun-93", "disk-mar-94"].each do |f|
  (0..39).each do |i|
    id_data =  File.binread("db/seed_data/%s/%02d.id" % [f, i*2])
    id = id_data[0].ord
    # if ID is empty, then the track isn't used
    if id == 0
      next
    end
    data_low = File.binread("db/seed_data/%s/%02d.dat" % [f, i*2])
    data_high = File.binread("db/seed_data/%s/%02d.dat" % [f, (i*2)+1])
    if data_low.length != 1024
      puts"%s: Skipping record %d: wrong length" % [f, i]
      next
    end
    if data_high.length != 1024
      puts"%s: Skipping record %d: wrong length" % [f, i+1]
      next
    end

    #p(id_data)
    #print("track ID is #{id}\n")
    #p(data_low)
    #p(data_high)

    Kmsave.create(disk_number: $dsknum, sector_id: id, sector_number_l: i*2, data_l: data_low, data_h: data_high)
  end
    $dsknum = $dsknum + 1
end


