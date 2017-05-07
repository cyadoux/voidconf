# Irssi
A terminal based IRC client for UNIX systems.

## Basic Configuration

### Configuring SASL for Irssi

Recent Irssi versions include built-in SASL support via /network:

	/network add -sasl_username <login> -sasl_password <password> -sasl_mechanism PLAIN freenode
	/server add -auto -net freenode -ssl -ssl_verify irc.freenode.net 6697


Save your new settings with:

	/save

If everything works you will see the "Z" mode set. It should look like this: "Mode change (+Zi) for user your-nick"

### Automatically identify with NickServ using irssi

Here's the configuration I use to make irssi automatically identify my nick. First, add the irc server(s) and enable auto connect:

	/server add -auto -network networkname irc.networkname.com 6667

Also, make sure the nick to be identified is used:
/network add -nick nickname networkname

Automatically join a channel:

	/channel add -auto #channel networkname

Identify your nickname with NickServ. This is where additional commands, such as auto invite, are added.
	/network add -autosendcmd "/msg nickserv identify password ;wait 2000" networkname