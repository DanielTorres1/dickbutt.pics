#!/usr/bin/env python3
import os
import requests
import time

# Image URLs and their SEO-friendly names
images = [
    # Original comic and timeline images
    ("https://i.imgur.com/8fzXYTF.jpeg", "dickbutt-original-comic-horribleville-kc-green.jpeg"),
    ("https://i.imgur.com/noi5DpT.jpeg", "dickbutt-batman-comic-meme.jpeg"),
    ("https://i.imgur.com/zTGOE6E.jpeg", "dickbutt-deviantart-rainbow-fan-art.jpeg"),
    ("https://i.imgur.com/a2wKPh3.jpeg", "dickbutt-4chan-thread-meme.jpeg"),
    ("https://i.imgur.com/E8G5cxx.gif", "dickbutt-wood-carving-gif-viral.gif"),
    ("https://i.imgur.com/J0PfD4Z.gif", "dickbutt-cyclist-ramp-gif-meme.gif"),
    ("https://i.imgur.com/cLqBCBs.gif", "dickbutt-thanks-for-reading.gif"),
    
    # Memes
    ("https://i.imgur.com/ZD19IJ2.jpeg", "dickbutt-tongue-twister-meme.jpeg"),
    ("https://i.imgur.com/OxREaxe.png", "dickbutt-thursday-motivation-meme.png"),
    ("https://i.imgur.com/i7SXVkQ.jpeg", "dickbutt-cake-day-celebration.jpeg"),
    ("https://i.imgur.com/d4KP7n9.jpeg", "dickbutt-dickward-squidward-mashup.jpeg"),
    
    # Gallery
    ("https://i.imgur.com/G5ItWA3.jpeg", "dickbutt-birthday-cake.jpeg"),
    ("https://i.imgur.com/qmOtqyb.jpeg", "dickbutt-rummy-scoreboard.jpeg"),
    ("https://i.imgur.com/qjsGGnm.jpeg", "dickbutt-3d-model-rainbow-cloud.jpeg"),
    ("https://i.imgur.com/iTaXP2K.jpeg", "dickbutt-sand-art-daytona-beach.jpeg"),
    ("https://i.imgur.com/Om02srE.jpeg", "dickbutt-evil-twin-butt-dick.jpeg"),
    ("https://i.imgur.com/dDiEUye.png", "dickbutt-buttdick-reversed.png"),
    ("https://i.imgur.com/0O0gIXM.jpeg", "dickbutt-3d-printed-figure.jpeg"),
]

def download_image(url, filename, max_retries=3):
    """Download an image from URL to the images directory"""
    filepath = os.path.join("images", filename)
    
    # Skip if file already exists and is not empty and is actually an image
    if os.path.exists(filepath):
        size = os.path.getsize(filepath)
        if size > 10000:  # Assume files > 10KB are valid images
            print(f"⏭️  Skipping (already exists): {filename} ({size} bytes)")
            return True
        else:
            # Remove small files (likely HTML error pages)
            os.remove(filepath)
            print(f"🗑️  Removed invalid file: {filename}")
    
    for attempt in range(max_retries):
        try:
            print(f"Downloading ({attempt + 1}/{max_retries}): {filename}")
            
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
                'Accept': 'image/webp,image/apng,image/*,*/*;q=0.8',
                'Accept-Language': 'en-US,en;q=0.9',
                'Referer': 'https://imgur.com/'
            }
            
            response = requests.get(url, headers=headers, timeout=30, allow_redirects=True)
            
            if response.status_code == 429:
                wait_time = (attempt + 1) * 10
                print(f"⏳ Rate limited, waiting {wait_time}s before retry...")
                time.sleep(wait_time)
                continue
            
            response.raise_for_status()
            
            # Check if we got HTML instead of an image
            content_type = response.headers.get('Content-Type', '')
            if 'html' in content_type.lower():
                print(f"⚠️  Received HTML instead of image, retrying...")
                time.sleep(5)
                continue
            
            with open(filepath, 'wb') as f:
                f.write(response.content)
            
            # Verify file was written and is a reasonable size
            file_size = os.path.getsize(filepath)
            if file_size > 1000:  # At least 1KB
                print(f"✓ Saved: {filename} ({file_size:,} bytes)")
                return True
            else:
                print(f"⚠️  File too small ({file_size} bytes), retrying...")
                os.remove(filepath)
                time.sleep(3)
                continue
                
        except requests.exceptions.HTTPError as e:
            if e.response.status_code == 429:
                wait_time = (attempt + 1) * 10
                print(f"⏳ Rate limited, waiting {wait_time}s before retry...")
                time.sleep(wait_time)
            else:
                print(f"✗ HTTP Error: {e}")
                if attempt == max_retries - 1:
                    return False
                time.sleep(5)
        except Exception as e:
            print(f"✗ Error: {e}")
            if attempt == max_retries - 1:
                return False
            time.sleep(5)
    
    return False

def main():
    # Create images directory if it doesn't exist
    os.makedirs("images", exist_ok=True)
    
    print("Starting image downloads...\n")
    
    successful = 0
    failed = 0
    failed_list = []
    
    for url, filename in images:
        result = download_image(url, filename)
        
        if result is True:
            successful += 1
        else:
            failed += 1
            failed_list.append((url, filename))
        
        # Wait between downloads to avoid rate limiting
        time.sleep(3)
    
    print(f"\n{'='*50}")
    print(f"Download complete!")
    print(f"Successful: {successful}")
    print(f"Failed: {failed}")
    if failed_list:
        print(f"\nFailed downloads:")
        for url, filename in failed_list:
            print(f"  - {filename}")
    print(f"{'='*50}")

if __name__ == "__main__":
    main()
