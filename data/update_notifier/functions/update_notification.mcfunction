#> update_notifier:update_notification
# @within function update_notifier:player_joined

scoreboard players enable @s MuteUpdateNotification
tellraw @s {"text":"[!] XXX の最新バージョンがリリースされました。","color":"yellow"}
tellraw @s {"text":"[ダウンロードページを開く]","clickEvent":{"action":"open_url","value":"https://xxxxxxx"},"color":"gold"}
tellraw @s {"text":"[次の更新までこのメッセージをスキップする]","color":"red","clickEvent":{"action":"run_command","value":"/trigger MuteUpdateNotification set 1"}}
