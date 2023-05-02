package.path = "?/init.lua;?.lua;"..package.path
local bin = require("bin")
local infinabits = bin.infinabits
local bits = bin.bits

local chronos = require("chronos")
--infinabits:conv("1")
-- 0000111001000011010011001010001001001110000001000100000001000111

function snowflake_timestamp(snowflake)
    local snowflake = tostring(infinabits.new(BigNum.new(snowflake)))
    local Timestamp = infinabits.new(snowflake:sub(1,42),true)
    local WID = bits.new(snowflake:sub(43,47),true)
    local PID = bits.new(snowflake:sub(48,52),true)
    local Increment = bits.new(snowflake:sub(53,64),true)
    local stamp = (Timestamp:tonumber() + BigNum.new("1420070400000"))/1000

    local date = os.date("*t", tonumber(tostring(stamp)))

    local temp = {
        TIMESTAMP = tonumber(tostring(stamp)),
        WID = tostring(WID:tonumber()),
        PID = tostring(PID:tonumber()),
        Increment = tostring(Increment:tonumber())
    }

    for i,v in pairs(date) do
        temp[i] = v
    end

    return temp
end
local start = chronos.nanotime()
local data = snowflake_timestamp("1027749399947919431")
local stop = chronos.nanotime()
print(("Data took %s seconds"):format(stop - start))

local cjson = require "cjson"

value = cjson.decode([[
{
    "id": "41771983423143937",
    "guild_id": "41771983423143937",
    "name": "general",
    "type": 0,
    "position": 6,
    "permission_overwrites": [],
    "rate_limit_per_user": 2,
    "nsfw": true,
    "topic": "24/7 chat about how to gank Mike #2",
    "last_message_id": "155117677105512449",
    "parent_id": "399942396007890945",
    "default_auto_archive_duration": 60
}
]])

for i,v in pairs(value) do
    print(i,v)
end

-- for i, v in pairs(data) do
--     print(i, v)
-- end
