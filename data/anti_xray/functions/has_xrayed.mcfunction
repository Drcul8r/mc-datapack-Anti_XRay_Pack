# Take relevent actions, players with "informed" tag will be messaged apon a positive - bans will be inforced if "x" in "store_inforced" = 1

tellraw @a[tag=informed] ["",{"selector":"@s","color":"red"},{"text":" Appears to be X-Raying","color":"gold"}]

execute if score x store_inforced matches 1 run ban @s[type=player] You have been banned for X-Raying
