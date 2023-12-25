#> update_notifier:player_joined
# @within
#   function update_notifier:tick

# アップデートが存在する上で、更新をミュートしていない場合は通知する
execute if data storage update_notifier: {isUpdateAvailable: true} unless score @s MuteUpdateNotification matches -2147483648..2147483647 run function update_notifier:update_notification

# スコア同期
scoreboard players operation @s JoinEvent = #Time JoinEvent
