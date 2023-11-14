# OSCPoint: PowerPoint add-in

<div align="center">
<img src="./assets/ribbon.png" style="max-width: 600px">

_Screenshot shows the OSCPoint tab on the PowerPoint ribbon_
</div>
The OSCPoint add-in is intalled on your Windows machine, and runs alongside PowerPoint. It provides an OSC API for PowerPoint.

## Installation instructions
- Download the [latest version](https://github.com/phuvf/oscpoint/releases)
- Unpack the .zip file to a temporary folder
- Run setup.exe from the temporary folder
- Once installation is complete, you can delete your temporary folder.

This COM add-in for PowerPoint requires some supporting frameworks, including:

- Microsoft .NET 4.7.2 (66MB)
- Microsoft Visual Studio 2010 Tools for Office Runtime (38MB)

Your computer will automatically download and install these items direct from Microsoft, if required.

Finally, if PowerPoint is currently running on your machine, you'll need to close and re-open it to load up the add-in.

For more details, including infomation on SmartScreen warnings, see the [installation guide for the OctoCue add-in](https://support.octocue.com/docs/add-in/add-in_installation), which follows exactly the same process - this avoids me writing it out twice.

## Configuration
The add-in will add a new **OSCPoint** tab to the PowerPoint ribbon.


Using the ribbon tab you can:

- Enable and disable OSC actions and feedbacks.
- Set the local port for incoming action messages - range is `1024` to `65535`, default `35551`
- Set the remote host for outgoing feedback messages - default `127.0.0.1`
- Set the remote port for outgoing feedback messages - range is `1024` to `65535`, default `35550`

Configuration settings are stored on your machine per-user and will persist between sessions.