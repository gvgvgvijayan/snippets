# Delete first n lines from a file:
	sed -i '1,3d' debug.log #Delete first three lines.

# Grep search with exclude directory
	grep -rin --exclude-dir={wp-content,.history} "'login_redirect'"

# Modify modified time and verify the modification
	touch -m -d "100 days ago" wp-config.php
	stat wp-config.php
	
# Copy last command to clipboard
	fc -ln -1 | xclip -sel clip
	
# Copy search term matching filepath to clipboard
	grep -ril "Lockout_Ip" ./src | xclip -sel clip
	
# Scan wireless network with its quality, encryption, frequency & ESSID
	sudo iwlist scanning
	
# Convert unix timestamp to date string
	date -d @1643188311

# Rsync
	sudo rsync -avuP --delete source_dir destination_dir
 	sudo rsync -avuP --delete /home/vijayan/Documents/my_files/users/ .
  	sudo rsync -avuP /run/media/vijayan/100c7b6f-e4b7-4c87-a278-811080a5cde6/home/vijayan/Documents/my_files/users/ /run/media/vijayan/vijayan1tb/media/users/
   	rsync --ignore-existing -avzh --delete --progress /run/media/vijayan/vijayan1tb/rsync/* ./rsync
    rsync -avh --delete --progress /media/vijayan/vg_1tb_kngstn/rsync/ ./rsync/

# Diff
	diff -qr /home/vijayan/Documents/my_files/users/ ./
 
# Shortcuts
	CTRL + P => Previous command
	CTRL + N => Next command
	CTRL + U => Delete the typed line
