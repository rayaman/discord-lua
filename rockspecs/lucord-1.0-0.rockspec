package = "lucord"
version = "1.0-0"
source = {
   url = "git://github.com/rayaman/multi.git",
   tag = "1.0.0",
}

description = {
   summary = "Lua Multi tasking library",
   detailed = [[
      This library contains many methods for multi tasking. Features non coroutine based multi-tasking, coroutine based multi-tasking, and system threading (Requires use of an integration).
      Check github for documentation.
   ]],
   homepage = "https://github.com/rayaman/lucord",
   license = "MIT"
}

dependencies = {
   "lua >= 5.1",
   "luasocket",
   "luasec", 
   "multi",
   "lanes",
   "bin",
   "lfs"
}

build = {
   type = "builtin",
   modules = {
      ["multi"] = "init.lua",
      ["multi.integration.lanesManager"] = "integration/lanesManager/init.lua",
   }
}