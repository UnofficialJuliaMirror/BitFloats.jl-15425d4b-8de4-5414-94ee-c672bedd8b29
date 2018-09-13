# * BitFloats

module BitFloats

export Float80, Float128

import Base: eps, exponent_half, exponent_mask, exponent_one, floatmax, floatmin, sign_mask,
             significand_mask, uinttype

import BitIntegers


# * definitions

primitive type Float80  <: AbstractFloat 80  end
primitive type Float128 <: AbstractFloat 128 end

BitIntegers.@define_integers 80

uinttype(::Type{Float80}) = UInt80
uinttype(::Type{Float128}) = UInt128


# * traits

sign_mask(::Type{Float80})            = 0x8000_0000_0000_0000_0000 % UInt80
exponent_mask(::Type{Float80})        = 0x7fff_0000_0000_0000_0000 % UInt80
exponent_one(::Type{Float80})         = 0x3fff_8000_0000_0000_0000 % UInt80
exponent_half(::Type{Float80})        = 0x3ffe_8000_0000_0000_0000 % UInt80
significand_mask(::Type{Float80})     = 0x0000_ffff_ffff_ffff_ffff % UInt80
explicit_bit(::Type{Float80}=Float80) = 0x0000_8000_0000_0000_0000 % UInt80
# non-implicit most significand bit of significand is actually stored for Float80

sign_mask(::Type{Float128})           = 0x8000_0000_0000_0000_0000_0000_0000_0000
exponent_mask(::Type{Float128})       = 0x7fff_0000_0000_0000_0000_0000_0000_0000
exponent_one(::Type{Float128})        = 0x3fff_0000_0000_0000_0000_0000_0000_0000
exponent_half(::Type{Float128})       = 0x3ffe_0000_0000_0000_0000_0000_0000_0000
significand_mask(::Type{Float128})    = 0x0000_ffff_ffff_ffff_ffff_ffff_ffff_ffff

eps(     ::Type{Float80})  = reinterpret(Float80,  0x3fc0_8000_0000_0000_0000 % UInt80)
floatmin(::Type{Float80})  = reinterpret(Float80,  0x0001_8000_0000_0000_0000 % UInt80)
floatmax(::Type{Float80})  = reinterpret(Float80,  0x7ffe_ffff_ffff_ffff_ffff % UInt80)

eps(     ::Type{Float128}) = reinterpret(Float128, 0x3f8f_0000_0000_0000_0000_0000_0000_0000)
floatmin(::Type{Float128}) = reinterpret(Float128, 0x0001_0000_0000_0000_0000_0000_0000_0000)
floatmax(::Type{Float128}) = reinterpret(Float128, 0x7ffe_ffff_ffff_ffff_ffff_ffff_ffff_ffff)


end # module
