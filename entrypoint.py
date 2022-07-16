#!/usr/bin/python
import os
import json
import pexpect

if os.getenv('AUTOMATE') != 'true':
    os.system('openvpn --config /etc/openvpn/*.ovpn --script-security 2 --up /usr/local/bin/sockd.sh')
else:
    with open ('/etc/openvpn/secrets.json', 'r') as f:
        secrets = json.loads(f.read())
        child = pexpect.spawn('openvpn --config "/etc/openvpn/*.ovpn" --script-security 2 --up /usr/local/bin/sockd.sh')
        child.expect('Username:.*')
        child.sendline(secrets['username'])
        child.expect('.*Password.*')
        child.sendline(secrets['password'])
        child.interact()
