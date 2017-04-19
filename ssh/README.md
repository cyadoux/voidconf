# SSH

### Set up SSH for Git
Identify if you have ssh installed:
```
$ ssh -v
OpenSSH_5.6p1, OpenSSL 0.9.8r 8 Feb 2011
```

Generate keys:
`$ ssh-keygen`

Start the ssh-agent and load your keys:
```
$ ps -e | grep [s]sh-agent
 9060 ?? 0:00.28 /usr/bin/ssh-agent -l
```

If the agent isn't running, start it manually with the following command:
`$ ssh-agent /bin/bash`

Load your new identity into the ssh-agent management program using the ssh-add command.
```
$ ssh-add ~/.ssh/id_rsa
Enter passphrase for /Users/emmap1/.ssh/id_rsa:
Identity added: /Users/emmap1/.ssh/id_rsa (/Users/emmpa1/.ssh/id_rsa)
```

Use the ssh-add command to list the keys that the agent is managing.
```
$ ssh-add -l
2048 7a:9c:b2:9c:8e:4e:f4:af:de:70:77:b9:52:fd:44:97 /Users/manthony/.ssh/id_rsa (RSA)
```

Install the public key on your Bitbucket account.