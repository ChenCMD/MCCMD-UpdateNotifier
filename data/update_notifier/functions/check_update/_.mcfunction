#> update_notifier:check_update/_
# @within function update_notifier:tick

# Base64 文字列をデコードする
# block base64 => update_notifier: _.b64str
data modify storage update_notifier: _.b64str set from block 2023 -64 1225 SkullOwner.Properties.textures[0].Value
# update_notifier: _ => returns:base64 bitArray
function base64:decode/m with storage update_notifier: _
data remove storage update_notifier: _

# デコードした Base64 を ASCII でエンコードする
# returns:base64 bitArray => args:ascii bitArray
data modify storage args:ascii bitArray set from storage returns:base64 bitArray
# args:ascii bitArray => returns:ascii str
data modify storage args:ascii ignoreChars set value [" "]
function ascii:encode/_

# パースした JSON 文字列を SNBT としてパースし、Compound として扱えるようにする
# returns:ascii str => update_notifier: _.value
data modify storage update_notifier: _.target set value "skinData"
data modify storage update_notifier: _.value set from storage returns:ascii string
data modify storage update_notifier: _.suffix set value ""
# update_notifier: _ => update_notifier: skinData
function update_notifier:check_update/parse_value.m with storage update_notifier: _
data remove storage update_notifier: _

# 更新の有無を boolean として取得しつつ、skinURL を更新する
# skinURL == skinData.textures.SKIN.url / skinURL = skinData.textures.SKIN.url
execute store success storage update_notifier: isUpdateAvailable byte 1 run data modify storage update_notifier: skinURL set from storage update_notifier: skinData.textures.SKIN.url
data remove storage update_notifier: skinData

# 更新が存在する場合は更新のスキップをリセットする
execute if data storage update_notifier: {isUpdateAvailable: true} run scoreboard objectives remove MuteUpdateNotification
#> Private
# @within function update_notifier:**
execute if data storage update_notifier: {isUpdateAvailable: true} run scoreboard objectives add MuteUpdateNotification trigger

# フラグ更新
data modify storage update_notifier: updateChecked set value true

# リセット
data remove storage returns:base64 bitArray
data remove storage returns:ascii str

# 念のため air にする
setblock 2023 -64 1225 air
