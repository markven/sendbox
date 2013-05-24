require 'open-uri' 
require 'net/http'
require 'RMagick'
require './GetStreetView.rb' 
include Magick

# 開啟一個二進制檔案，將檔案物件放入 f 這個變數內
open('map_sv2.jpg', 'wb') do |f|
    # 將底下網址回傳的內容放入 image 這個變數內
    str="http://cbk1.google.com/cbk?output=tile&panoid=4fe6hEN9GJC6thoQBcgv0Q&zoom=4&x=10&y=2&cb_client=maps_sv" 

    uri=URI.parse(str)

    image = Net::HTTP.get(uri)
    
    # 將內容寫入檔案內
    f.write(image)
    
    # 關閉檔案
    f.close()
end

pana_id = ["rZFa29KMox1vA6FtkenRKA","4fe6hEN9GJC6thoQBcgv0Q","ex6piqtBNF4JVkkH4GZEmw"]

pana_id2 = [0, "BkCJ-axqCm9AwVxJ8_KHFA", 1, "_UF-wxdUOBctmWZWPywqDQ", 2, "-5PWEIDO5dymPVsMvZTW0A", 3, "wsZsR2_nfuxIg0NpYlgJng", 4, "qkr-ihPU_mvdatiDBMlvFg", 5, "aH0uEV5noCL1-YUY3Lev2g", 6, "qw73KqRFrkc9rPOWw9Jr_A", 7, "UY08XKTC2o-N6r1-9JosLA", 8, "NCgum9hbXcuTkrEakDy2kQ", 9, "ZlYjM7L598mit-beOg7n5w", 10, "Gr0fmHggNGWjMKbNU_GZlg", 11, "uRv6WssyH1cJ4NFJwh1H9Q", 12, "qlu3ZPmYhFb34IIVWn3IUw", 13, "nFw43EuxCjyo3cclrrCWPA", 14, "L64MAGkveWbZV6KVAm91IQ", 15, "hvCGK33EMUCUDzZNJNiiPg", 16, "ZIVE0JvSHyiRan9hWbWstw", 17, "hTM3iOncqPKvgQBPbMGGGw", 18, "X2BRSstFgoa0bYFbHpVIjw", 19, "u3PUSfSNBH1i9WSDesTbqg", 20, "BTB9Q162vgHplyE2lE49hQ", 21, "vVoLHt94GSiCwXrNISWVBA", 22, "Dh4p9zSUvd7vca-_IRJW4Q", 23, "xwfMsBV0acdJUV5rhgn6ig", 24, "36YLgW5UGYy7Lx-Nd306mg", 25, "iLnJva5s4Hd-XrveTeURPA", 26, "-5b77GvpzCU4juNmfi2Z4A"]

#for i in 1 .. 2
#	GetStreetView("rZFa29KMox1vA6FtkenRKA",i)
#end

#pana_id.each do |i|
#    GetStreetView(i,2,"image")
#end

for i in 1 ..26

    GetStreetView(pana_id2[i*2-1],2,"image")

end

=begin

cat = ImageList.new('map_sv2.jpg')
cat3 = ImageList.new
mosaic = ImageList.new
mosaic.new_image(1024, 512, HatchFill.new('white', 'gray90'))
cat3.read "http://cbk1.google.com/cbk?output=tile&panoid=4fe6hEN9GJC6thoQBcgv0Q&zoom=4&x=10&y=2&cb_client=maps_sv"
cat2=cat.edge
mosaic.composite!(cat,512,0,CopyCompositeOp)
mosaic.composite!(cat2,0,0,CopyCompositeOp)
#mosaic.display
#cat3.display
cat2.write("animated.jpg")
cat3.write("animated2.jpg")
mosaic.write("animated_m.jpg")	

	
=end


# puts open('http://cbk1.google.com/cbk?output=tile&panoid=4fe6hEN9GJC6thoQBcgv0Q&zoom=4&x=10&y=2&cb_client=maps_sv').read
