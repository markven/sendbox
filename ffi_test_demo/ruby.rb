
require 'ffi'

module MyLib
  extend FFI::Library
  ffi_lib './libmylib.dylib'
  attach_function :plus, [:int ,:int], :int
end

p MyLib.plus(1, 2)

#透過模組化將C func叫出來
#然後再透過ruby語法給叫出來執行