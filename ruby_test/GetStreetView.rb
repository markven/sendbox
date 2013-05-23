=begin
這是得到GetStreetView(panoid_i,zoom)
獨立出來的fuction

=end	

require 'RMagick'
include Magick

def GetStreetView(panoid_i,zoom)

	basew = 512
	baseh = 512
    matchw = 96
    matchh = 48
    x = (2 ** zoom) - (matchw*(2 ** zoom)/basew)
    y = ((2 ** zoom)-1) - (matchh * (2 ** zoom)/baseh)
    width = basew * (2 ** zoom) - matchw * (2 ** zoom)
    height = baseh * (2 ** (zoom-1)) - matchh * (2 ** zoom)


	mosaic_pana = ImageList.new
	mosaic_pana.new_image(width, height)

	for i in 0 .. y.ceil
		for j in 0 .. x.ceil
			mosaic_temp = ImageList.new
			mosaic_temp.read "http://cbk1.google.com/cbk?output=tile&panoid="+panoid_i+"&zoom="+zoom.to_s+"&x="+j.to_s+"&y="+i.to_s+"&cb_client=maps_sv"
			mosaic_pana.composite!(mosaic_temp, j*basew , i*baseh , CopyCompositeOp)
		end
	end

	mosaic_pana.write("pana_"+zoom.to_s+"_"+panoid_i+".jpg")

end