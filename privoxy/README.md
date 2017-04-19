Install privoxy:
`xbps-install -S privoxy`

Set browser to use manual proxy for HTTP and SSL connections to `127.0.0.1` port `8118`.

Start privoxy:
  `# /usr/sbin/privoxy --user privoxy /etc/privoxy/config`

To check the status of privoxy: `http://config.privoxy.org/show-status`.