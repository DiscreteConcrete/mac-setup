tell application "iTerm"
	tell current window
		create tab with default profile
		tell the last tab
			tell the last session
				write text "cd ~/sphere/api"
				write text "make devenv"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "cd ~/sphere/api"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "cd ~/sphere/api"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "cd ~/sphere/api"
				write text "node"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "cd ~/sphere/api"
				write text "mysql -D sphere_test"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "cd ~/sphere/api"
				write text "mysql -D sphere"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "./cloud_sql_proxy -dir ."
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "mysql -S sphere-1a6cd:europe-west1:sphere-prod-replica4 -u sqlproxy -D sphere_prod"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "mysql -S sphere-1a6cd:europe-west1:sphere-prod-failover4 -u sqlproxy -D sphere_prod"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "mysql -S sphere-1a6cd:europe-west1:sphere-prod -u sqlproxy -D sphere_prod"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "mysql -S sphere-1a6cd:europe-west1:sphere-test -u sqlproxy -D sphere_staging"
			end tell
		end tell
		create tab with default profile
		tell the last tab
			tell the last session
				write text "cd ~/sphere/kubernetes"
			end tell
		end tell
	end tell
end tell
