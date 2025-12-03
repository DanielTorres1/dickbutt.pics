#!/bin/bash

# Create images directory
mkdir -p images

# Download images with wget using proxy
cd images

# Original comic and timeline images
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-original-comic-horribleville-kc-green.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/8fzXYTF.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-batman-comic-meme.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/noi5DpT.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-deviantart-rainbow-fan-art.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/zTGOE6E.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-4chan-thread-meme.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/a2wKPh3.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-wood-carving-gif-viral.gif" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/E8G5cxx.gif"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-cyclist-ramp-gif-meme.gif" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/J0PfD4Z.gif"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-thanks-for-reading.gif" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/cLqBCBs.gif"

# Merchandise images (Amazon images don't need proxy)
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-tshirt-merchandise.jpg" "https://m.media-amazon.com/images/I/81qFCtjrLgL._AC_SL1500_.jpg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-waterproof-stickers.jpg" "https://m.media-amazon.com/images/I/61DHN2X-RXL._AC_SL1000_.jpg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-collectible-figure.jpg" "https://m.media-amazon.com/images/I/61vkdIN9N1L._AC_SL1000_.jpg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-music-cryptoadz.jpg" "https://m.media-amazon.com/images/I/51xt6Q7x4ML._UX250_FMwebp_QL85_.jpg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-collection-limited-edition.jpg" "https://m.media-amazon.com/images/I/51YUDzjNEgL.jpg"

# Memes
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-tongue-twister-meme.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/ZD19IJ2.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-thursday-motivation-meme.png" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/OxREaxe.png"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-cake-day-celebration.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/i7SXVkQ.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-dickward-squidward-mashup.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/d4KP7n9.jpeg"

# Gallery
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-birthday-cake.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/G5ItWA3.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-rummy-scoreboard.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/qmOtqyb.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-3d-model-rainbow-cloud.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/qjsGGnm.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-sand-art-daytona-beach.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/iTaXP2K.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-evil-twin-butt-dick.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/Om02srE.jpeg"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-buttdick-reversed.png" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/dDiEUye.png"
wget --user-agent="Mozilla/5.0" --wait=1 -O "dickbutt-3d-printed-figure.jpeg" "https://xwkohqt7pf.execute-api.us-east-1.amazonaws.com/proxy/https://i.imgur.com/0O0gIXM.jpeg"

echo ""
echo "Download complete!"
echo "Listing downloaded files:"
ls -lh
