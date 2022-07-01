# Repo Sync:
	https://stackoverflow.com/a/52828742/1593365
	Git CMD for repo sync:
	git remote add protected_repo https://github.com/theirusername/their_repo.git
	git fetch parent_repo
	git checkout --no-track parent_repo/release/2.5.3
	
	git checkout branch-name 
	git fetch parent_repo
	git merge parent_repo/branch-name
	
	git push -u origin branch-name

# Git get file history:
	git log --follow -p --stat ./src/component/store/index.js

# Git conflict resolve:
	Modify your file with editor or git-diff tool
	git add file1 file2
	git commit -m "message"
	git push

# Aborting the merge:
	git merge --abort
	
# List branches having the given commit ID:
	git branch -r --contains <commit_id>
	
# Git merge remote branch to local:
	git fetch origin remote_branch_name
	git merge origin/remote_branch_name

# Git get authors list sort by commit-count:
	git shortlog -n -s -- filepath

# Git diff exclude files:
	git diff -- . ':!assets/' ':!extra/' ':!*.pot'