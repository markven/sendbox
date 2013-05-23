require 'ffi'

module Libcv
  extend FFI::Library
  ffi_lib './libcv2.so' #如果是mac要吃dylib ,linx要吃.so
  attach_function :main, [], :int
end

p Libcv.main()

#透過模組化將C func叫出來
#然後再透過ruby語法給叫出來執行