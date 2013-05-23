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

#for i in 1 .. 2
#	GetStreetView("rZFa29KMox1vA6FtkenRKA",i)
#end

pana_id.each do |i|
    GetStreetView(i,2,"image")
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
