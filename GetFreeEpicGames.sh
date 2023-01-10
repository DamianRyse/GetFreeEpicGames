#!/bin/bash
BASEURL="https://store-site-backend-static-ipv4.ak.epicgames.com/freeGamesPromotions?locale=en-US&country=DE&allowCountries=DE"
DISCORD_WEBHOOK="https://discord.com/api/webhooks/ENTERYOURWEBHOOKURLHERE"
CACHE_FILE=$(dirname "$0")/.cachefile

ALL_ITEMS=$(xidel "$BASEURL" -e '($json).data.Catalog.searchStore.elements' --silent)

ALL_DISCOUNTS=$(echo $ALL_ITEMS | jq '.[] | select(.promotions.promotionalOffers | length > 0) | select(.)')
ALL_FREE=$(echo $ALL_DISCOUNTS | jq -r '. | select(.promotions.promotionalOffers[].promotionalOffers[].discountSetting.discountPercentage == 0) | [.title, .description, .keyImages[2].url] | @tsv')
cd $(dirname "$0")

if test -f "$CACHE_FILE"; then
    CACHE_CONTENT=$(cat $CACHE_FILE)
    if [[ "$CACHE_CONTENT" == "$ALL_FREE" ]]; then
        exit
    else
        echo "$ALL_FREE" > $CACHE_FILE
        echo "$ALL_FREE" |
        while IFS=$'\t' read -r title descr thumbnail; do
            ./discord.sh \
            --webhook-url=$DISCORD_WEBHOOK \
            --username "Free EpicGames" \
            --title "$title" \
            --description "$descr" \
            --color 0xFFBF00 \
            --url "https://store.epicgames.com/free-games" \
            --image "$thumbnail" \
            --footer "Free EpicGames games | Script by Damian Ryse" \
            --footer-icon "https://cdn.discordapp.com/icons/409050120894545920/44a51cb058f3fd30c1e12144ae93df06.webp?size=100"
   	 done
    fi
else
    echo "$ALL_FREE" > $CACHE_FILE
    echo "$ALL_FREE" |
    while IFS=$'\t' read -r title descr thumbnail; do
            ./discord.sh \
            --webhook-url=$DISCORD_WEBHOOK \
            --username "Free EpicGames" \
            --title "$title" \
            --description "$descr" \
            --color 0xFFBF00 \
            --url "https://store.epicgames.com/free-games" \
            --image "$thumbnail" \
            --footer "Free EpicGames games | Script by Damian Ryse" \
            --footer-icon "https://cdn.discordapp.com/icons/409050120894545920/44a51cb058f3fd30c1e12144ae93df06.webp?size=100"
    done
fi
