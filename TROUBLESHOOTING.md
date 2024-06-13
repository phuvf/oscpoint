
# OSCPoint troubleshooting

This page contains information on how to troubleshoot common issues with OSCPoint.

## Installation issues

A couple of issues I've seen with installation:

-  Use the built-in unzip tool in Windows to extract the zip file. Some users have reported issues other tools like 7zip.  
  The cause of this is unknown.


## It's installed but not working

### 1. First steps

- Check you've installed the add-on correctly. Does the OSCPoint tab appear in PowerPoint? If not, investigate this first.  
    You can view a list of active add-ins by opening PowerPoint and browsing to `File > Options > Add-ins`.  
    Here you can also enable and disable the add-in using the `Manage COM Add-ins` option.
- On the OSCPoint tab, check you've enabled `actions` and `feedbacks`. If these are disabled, OSCPoint won't send or receive any OSC messages.

### 2. Network issues

OSCPoint sends and receives OSC messages as UDP packets over normal IT networking, so most of the issues you'll experience will be network related.

- First, check your IP setup. Are the machines on the same network? Do you have two machines with the same IP causing issues?  
  Check for typos and incorrect subnet masks.
- Check you've configured the IP and port details in OSCPoint and the Companion module (if you're using it) correctly. See [CONFIGURATION.md](CONFIGURATION.md) for examples.
- Check you can ping the machine running OSCPoint from the machine sending OSC messages. If you can't, you have a network issue - investigate this first.

If your machines can ping each other, but OSCPoint still isn't working, you may have a firewall issue. The next steps I'd recommend is to disable the firewall on the machine running OSCPoint and see if that resolves the issue. If it does, you'll need to configure the firewall to allow OSCPoint to send and receive UDP packets on the port you've configured.

Trying to run OSCPoint across multiple vLANs? You'll need to talk to your IT team to ensure the network is configured correctly.

### 3. Log files

If none of this helps, check the log files for both OSCPoint and Companion.

- Access the OSCPoint log files using the button on the OSCPoint tab in PowerPoint.
- Access the Companion log files by opening the GUI and selecting the `Log` tab.

A read through these log files may give you a clue as to what's going wrong.

> [!NOTE] 
> If you're after assistance from the community, please provide the log files when asking for help - this will help others diagnose the issue you're experiencing

## Helpful tools

It's often useful to have some tools to help you diagnose network issues. Here are a couple of free tools I use to debug OSC issues:

- [Protokol](https://hexler.net/protokol) - a free OSC (and MIDI) monitoring tool viewer. This is a great tool to see if OSC messages are being sent and received correctly.

> [!NOTE] 
> 
> Only one Windows service can bind to a port at a time. If you're trying to use Protokol to see OSC messages, quit Companion first as it'll be using the port Protokol is trying to bind to.

I'd also recommend [Wireshark](https://www.wireshark.org/). This is a free powerful tool that can help you see what's happening on your network. It's not for beginners, but a great when you need to dive deep.