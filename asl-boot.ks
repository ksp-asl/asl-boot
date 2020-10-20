clearscreen.
print "ASL Boot v1.0".
local env is lex().
local function cpr {parameter p. copypath("0:/" + p, p). runpath(p, env).}
cpr("init/init.ks").
cpr(env:init:prg).