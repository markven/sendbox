require 'open-uri' 
require 'net/http'
require 'RMagick'
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

def GetStreetView(panoid_i,zoom)

	basew = 512
	baseh = 512
    matchw = 96
    matchh = 48
    x = 2 ** zoom - matchw * (2 ** zoom) / basew
    y = (2 ** zoom - 1) - (matchh * (2 ** zoom) / baseh)
    width = basew * (2 ** zoom) - matchw * (2 ** zoom)
    height = baseh * (2 ** zoom - 1) - matchh * (2 ** zoom)


	mosaic_pana = ImageList.new
	mosaic_pana.new_image(width, height)

	for i in 1 .. y
		for j in 1 .. x
			mosaic_temp = ImageList.new
			mosaic_temp.read "http://cbk1.google.com/cbk?output=tile&panoid="+panoid_i.to_s+"&zoom="+zoom.to_s+"&x="+j.to_s+"&y="+i.to_s+"&cb_client=maps_sv"
			mosaic_pana.composite!(mosaic_temp, j*basew , i*baseh , CopyCompositeOp)
		end
	end

	mosaic_pana.write("pana_"+zoom.to_s+"_"+panoid_i+".jpg")

end

GetStreetView("4fe6hEN9GJC6thoQBcgv0Q",2)


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
