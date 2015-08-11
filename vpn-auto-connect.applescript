on idle
	tell application "System Events"
		tell network preferences
			get the name of current location
			set networkName to the result
			
			if (networkName is equal to "#NETWORK_PROFILE_NAME") then
				tell current location
					set myConnection to the service "#VPN_NAME"
					if myConnection is not null then
						if current configuration of myConnection is not connected then
							connect myConnection
						end if
					end if
				end tell
				return 120
			end if
		end tell
	end tell
end idle
