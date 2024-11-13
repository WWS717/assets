#!/bin/sh

# CDN Links for Assets

cd /Users/air/github/wws/assets/

touch /Users/air/github/wws/assets/tool/python/remote-urls.txt

tree > /Users/air/github/wws/assets/tool/python/remote-urls.txt

echo '\n\n###\n\n' >> /Users/air/github/wws/assets/tool/python/remote-urls.txt

/usr/local/bin/python3 /Users/air/github/wws/assets/tool/cdn-links.py >> /Users/air/github/wws/assets/tool/python/remote-urls.txt

open -a TextEdit /Users/air/github/wws/assets/tool/python/remote-urls.txt