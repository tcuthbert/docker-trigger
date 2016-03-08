import sys
from trigger.cmds import Commando
from twisted.python import log

class ShowClock(Commando):
    """Execute 'show clock' on a list of Cisco devices."""
    vendors = ['cisco']
    commands = ['show clock', 'show version', 'show ip int brief', 'show inventory', 'show run | in cisco']

if __name__ == '__main__':
    # log.startLogging(sys.stdout)
    device_list = ['r1.demo.local']
    showclock = ShowClock(devices=device_list)
    showclock.run() # Commando exposes this to start the event loop

    print '\nResults:'
    print showclock.results
    for k, v in showclock.results.items():
        print k, v
        for item in v:
            print item
    print '\nStruct Results:'
    print showclock.parsed_results
    for k, v in showclock.parsed_results.items():
        print k
        for item in v:
            print item
