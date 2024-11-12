#!python3

# To save full website (This could overload the target server, So, be careful)

from pywebcopy import save_website
save_website(
url="https://statrys.com/blog/ecommerce-website-cost#:~:text=The%20total%20cost%20to%20build,%2415%2C000%20per%20month%20on%20average.",
project_folder="/Users/air/github/projects/assets/tool/py/web/",
project_name="site_copy",
bypass_robots=True,
debug=True,
open_in_browser=True,
delay=None,
threaded=False,
)
