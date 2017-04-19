# Irssi
A terminal based IRC client for UNIX systems.

## Basic Configuration

### SSL Connection

Freenode uses port 6697, 7000 and 7070 for SSL connections (not 6667). To connect to Freenode IRC network via SSL you have to setup an new connection. Start irssi and run:

  /server add -auto -ssl -ssl_verify -ssl_capath /etc/ssl/certs -network freenode -port 6697 chat.freenode.net

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