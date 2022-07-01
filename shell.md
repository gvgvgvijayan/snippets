#Delete first n lines from a file:
	sed -i '1,3d' debug.log #Delete first three lines.

#Grep search with exclude directory
	grep -rin --exclude-dir={wp-content,.history} "'login_redirect'"

#Modify modified time and verify the modification
	touch -m -d "100 days ago" wp-config.php
	stat wp-config.php
	
#Copy last command to clipboard
	fc -ln -1 | xclip -sel clip
	
#Copy search term matching filepath to clipboard
	grep -ril "Lockout_Ip" ./src | xclip -sel clip
	
#Scan wireless network with its quality, encryption, frequency & ESSID
	sudo iwlist scanning
	
#Convert unix timestamp to date string
	date -d @1643188311

#Shortcuts
CTRL + P => Previous command
CTRL + N => Next command
CTRL + U => Delete the typed line