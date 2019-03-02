# Cryptography Simulation in R

library("openssl")

# Generating Key
p = bignum("511704374946917490638851104912462284144240813125071454126151")
q = bignum("470287785858076441566723507866751092927015824834881906763507")
e = bignum(36263)
n = bignum(p * q)
delta_n = bignum((p-1)*(q-1))
d = bignum_mod_inv(e, delta_n)
print(d)

# Transforming string to number
str = charToRaw("This is a secret message from FinTech!")
bn = bignum(str)
base = base64_encode(bn)
print(base)

# Encryption
c = bignum_mod_exp(bn, e, n)
print(c)
cbn = base64_encode(c)
print(cbn)

# Decryption
cbnr = base64_decode(cbn)
print(cbnr)
cbnbig = bignum(cbnr)
mess = bignum_mod_exp(c, d, n)
print(mess)
print(rawToChar(mess))

message = base64_decode("E9t84NWMZcuSiUUT4BXrCNplSelDocUl2loMaoeci/KmHNwRROa7uki3Ybte4hMHWXA=")
bigm = bignum(message)
mmess = bignum_mod_exp(bigm, d, n)
print(mmess)
print(rawToChar(mmess))
