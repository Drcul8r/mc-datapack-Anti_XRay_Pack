tag drcul8r add ignore
tag Temet0 add ignore

# Detect when a player should be monitored - players with the "ignore" tag will never be monitored

execute as @a[tag=!ignore,tag=!temp_ignore] unless entity @s[scores={track_monitored_player=1}] at @s positioned ~ 10 ~ as @s[dy=-70,scores={temp_mine_diamond_ore=1..}] run function anti_xray:start_check
execute as @a[tag=!ignore,tag=!temp_ignore] unless entity @s[scores={track_monitored_player=1}] at @s positioned ~ 10 ~ as @s[dy=-70,scores={temp_mine_deepslate_diamond_ore=1..}] run function anti_xray:start_check

# Preform checks when a tracked player mines diamond diamond_ore

execute as @a[tag=!temp_ignore, scores={track_monitored_player=1}] at @s positioned ~ 10 ~ as @s[dy=-70,scores={temp_mine_diamond_ore=1..}] run function anti_xray:checks
execute as @a[tag=!temp_ignore, scores={track_monitored_player=1}] at @s positioned ~ 10 ~ as @s[dy=-70,scores={temp_mine_deepslate_diamond_ore=1..}] run function anti_xray:checks

# Calculate mine_stone scoreboard

execute as @a[scores={track_monitored_player=1}] run scoreboard players operation @s track_mine_stone += @s temp_mine_deepslate

# Timing System

scoreboard players remove @a[scores={track_timer=1..}] track_timer 1
execute as @a[scores={track_timer=950}] run function anti_xray:on_min_time
execute as @a[scores={track_timer=0}] run function anti_xray:on_max_time

# Reset scores

scoreboard players reset @a temp_mine_diamond_ore
scoreboard players reset @a temp_mine_deepslate_diamond_ore

scoreboard players reset @a temp_mine_deepslate
execute as @a unless entity @s[scores={track_monitored_player=1}] run scoreboard players reset @s track_mine_stone
execute as @a unless entity @s[scores={track_monitored_player=1}] run scoreboard players reset @s track_sprint_time