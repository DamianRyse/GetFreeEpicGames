# Get Free Epic Games
## ... for your Discord server
[![Support Server](https://img.shields.io/discord/409050120894545920?color=%23ef5600&label=DISCORD&style=for-the-badge)](https://discord.gg/YP4eNUF)

This bash script will parse Epic Games for currently available free games. It won't post games which are free by default but have a 100% discount.
To run this script, [Discord.sh](https://chaoticweg.cc/discord.sh) is required to be in the same directory.

## How to use

- Save the bash script to your linux computer.
- Also save a copy of [Discord.sh](https://chaoticweg.cc/discord.sh) into the same folder
- Edit the bash script on line 3, replace the URL with your Discord Webhook URL.
- Make both scripts executable: `chmod +x *.sh`
- Run the script `./GetFreeEpicGames.sh`
- For best experience, consider setting up an automated execution. (systemd timers, cronjobs, etc.)
- Make sure the script is able to create a cachefile within the same directory.

## Screenshots
#### Example post
![](https://i.imgur.com/JYA1Pjk.png)

## Copyright
Feel free to copy, modify and distribute the script as you like! If you like my script, I'd be glad to be mentioned in your clone.