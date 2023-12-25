#> update_notifier:load
# @within tag/function minecraft:load

#> Private
# @within function update_notifier:**
  #declare storage update_notifier:
  scoreboard objectives add JoinEvent dummy

# player_head を設置する座標を forceload しておく
forceload add 2023 1225

# フラグリセット
data modify storage update_notifier: updateChecked set value false

# 初期化されていなければ初期化
execute unless data storage update_notifier: skinURL run function update_notifier:initialize
