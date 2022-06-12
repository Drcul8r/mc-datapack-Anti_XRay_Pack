# Check if conditions are ment apon a valid diamond mined - if so, run function anti_xray:has_xrayed

execute as @s[scores={track_sprint_time=..3000}] as @s[scores={track_mine_stone=..40}] as @s[scores={track_mine_stone=16..}] run function anti_xray:has_xrayed
function anti_xray:on_max_time