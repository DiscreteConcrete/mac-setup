tell application "iTerm"
	activate
	set myterm to (make new terminal)
	tell myterm
		launch session "Default Session"
		tell the last session
			write text "cd ~/sphere/api"
			write text "make devenv"
		end tell
		launch session "Default Session"
		tell the last session
			write text "cd ~/sphere/api"
		end tell
		launch session "Default Session"
		tell the last session
			write text "cd ~/sphere/api"
		end tell
		launch session "Default Session"
		tell the last session
			write text "cd ~/sphere/api"
			write text "node"
		end tell
		launch session "Default Session"
		tell the last session
			write text "cd ~/sphere/api"
			write text "mysql -D sphere_test"
		end tell
		launch session "Default Session"
		tell the last session
			write text "cd ~/sphere/api"
			write text "mysql -D sphere"
		end tell
		launch session "Default Session"
		tell the last session
			write text "./cloud_sql_proxy -dir ."
		end tell
		launch session "Default Session"
		tell the last session
			write text "mysql -S sphere-1a6cd:europe-west1:sphere-prod-replica2 -u sqlproxy -D sphere_prod"
		end tell
		launch session "Default Session"
		tell the last session
			write text "mysql -S sphere-1a6cd:europe-west1:sphere-prod-failover -u sqlproxy -D sphere_prod"
		end tell
		launch session "Default Session"
		tell the last session
			write text "mysql -S sphere-1a6cd:europe-west1:sphere-prod -u sqlproxy -D sphere_prod"
		end tell
		launch session "Default Session"
		tell the last session
			write text "mysql -S sphere-1a6cd:europe-west1:sphere-test -u sqlproxy -D sphere_test"
		end tell
		launch session "Default Session"
		tell the last session
			write text "cd ~/sphere/kubernetes"
		end tell
	end tell
end tell
