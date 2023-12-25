#> update_notifier:player_joined
# @within function update_notifier:tick

# タグ付与
tag @s add Joined

# スコア同期
scoreboard players operation @s JoinEvent = #Time JoinEvent
