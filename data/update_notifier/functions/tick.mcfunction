#> update_notifier:tick
# @within tag/function minecraft:tick

#> Private
# @within function
#   update_notifier:tick
#   update_notifier:player_joined
  #declare score_holder #Time
  #declare tag Joined

# アップデートチェック
# player_head のスキンデータの fetch は非同期に行われるため、
# fetch が終了した後 (= SkullOwner.Properties が fill された後) にアップデートを確認する
execute if data storage update_notifier: {updateChecked: false} if loaded 2023 -64 1225 run setblock 2023 -64 1225 player_head{SkullOwner:{Name:"ChenCMD"}}
execute if data storage update_notifier: {updateChecked: false} if loaded 2023 -64 1225 if data block 2023 -64 1225 SkullOwner.Properties run function update_notifier:check_update/_

# プレイヤー join 判定
execute as @a unless score @s JoinEvent = #Time JoinEvent run function update_notifier:player_joined
scoreboard players add #Time JoinEvent 1
scoreboard players operation @a JoinEvent = #Time JoinEvent

# アップデートが存在する上で、更新をミュートしていない場合は通知する
execute if data storage update_notifier: {updateChecked: true, isUpdateAvailable: true} as @a[tag=Joined] unless score @s MuteUpdateNotification matches -2147483648..2147483647 run function update_notifier:update_notification
execute if data storage update_notifier: {updateChecked: true} run tag @a remove Joined
