# Exclude specific directories and search:
`grep -rin --exclude-dir={wp-content,.history} "'login_redirect'"`
  
# Exclude certain file type:
`git grep 'send(' -- '*.php'`
  
# Exclude specific directories, file extension and search:
`grep  --exclude-dir={wp-content,.history} --exclude=\*.min.{css,js}  -rin "plugin-update-tr"`
  
# Include Specific file type:
`grep -rin --include=\*.php  --exclude-dir={wp-content,.history} "cron_schedules`

# Trim matching lines:
- Useful to search in minified asset files

`grep -rinoE  ".{0,10}admin.php\?page=wdf-scan&view=issues.{0,10}"`

Reference: https://stackoverflow.com/questions/2034799/how-to-truncate-long-matching-lines-returned-by-grep-or-ack
