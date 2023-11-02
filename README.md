![OSCPoint logo](assets/oscpoint-logo-small.png)

# OSCPoint -  an OSC API for PowerPoint

> [!WARNING]
> OSCPoint is still under active development, and has not reached a beta-stage yet. There are likely to be bugs, and the API may change without warning.
> 
> **DO NOT USE ON PRODUCTION SYSTEMS**
>
> If you give this a go, please share your feedback and issues using the [issue tracker on GitHub](https://github.com/phuvf/oscpoint/issues).
>
> A Bitfocus Companion module to accompany OSCPoint is current in development, but is not yet included in the current Companion builds - see [companion-module-zinc-oscpoint](https://github.com/bitfocus/companion-module-zinc-oscpoint) for details.

OSCPoint is a free PowerPoint add-in that allows Open Sound Control (OSC) control of PowerPoint on Windows. It's primarily designed to be used with BitFocus Companion, but should work with any OSC client that can send and receive OSC messages over UDP.

It's designed to be used with PowerPoint 2016 or later.

## Support

OSCPoint is developed by [Nick Roberts](https://github.com/phuvf). My day job is head of development for [OctoCue](https://octocue.com), so the OSCPoint PowerPoint add-in uses OctoCue's code signing certificate, in exchange for a bit of brand exposure.

If you have questions or find bugs please use the [issue tracker on GitHub](https://github.com/phuvf/oscpoint/issues).

For feature requests, please check the [Roadmap](#roadmap) section below, and if your idea isn't there, please [raise an issue](https://github.com/phuvf/oscpoint/issues/new?labels=enhancement&template=feature_request.md) on GitHub.

If you find this project useful, consider buying me a coffee:

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/X8X073GQ3)

I'm always looking for interesting ideas to work on - check out my [GitHub profile](https://github.com/phuvf) to see if I might be a good match for your project.

## Capabilites and limitations

OSCPoint allows you to control PowerPoint using **actions**, and get information about the state of PowerPoint using **feedbacks**.

See the [Actions](ACTIONS.md) and [Feedbacks](FEEDBACKS.md) files for full details.

OSCPoint is not:

- A one-stop GUI for controlling PowerPoint
- Available on plaforms other than Windows

> [!WARNING]
> OSCPoint gives you the ability to navigate your PowerPoint show without it being the active (focussed) window.
> 
> Media elements and slide transitions may not play correctly when PowerPoint does not have focus.

## Downloads

| Date       | Version | Release notes   | Link                                                                             |
| ---------- | ------- | --------------- | -------------------------------------------------------------------------------- |
| 2023-11-01 | 1.0.0.7 | [Change log](./ChangeLog.md) | [Download](https://oscpoint.blob.core.windows.net/downloads/oscpoint-1.0.0.7.zip) |

## Installation instructions
- Download the .zip file and save it to your computer
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

The add-in will add a new **OSCPoint** tab to the PowerPoint ribbon. Here you can:

- Globally disable OSCPoint  
*Using this leaves the add-in running, but it will no longer react to incoming OSC actions, or emit OSC feedback.*
- Configure the local port for incoming OSC messages - default `35551`
- Configure the remote host and port for outgoing OSC messages - default `127.0.0.1` and `35550`

Configuration settings are stored on your machine per-user and will persist between sessions.


## OSC Actions

OSC actions are messages you can send to OSCPoint to control PowerPoint.

See [ACTIONS.md](ACTIONS.md) for a full list of OSC actions available.


## OSC Feedbacks

Feedbacks are the messages OSCPoint sends to your OSC client to tell you about the current state of PowerPoint.

See [FEEDBACKS.md](FEEDBACKS.md) for a full list of OSC feedbacks available.

## Roadmap

These ideas have been suggested, but are not yet implemented:

- Feedback for when a slide transition is running
- Screen switching in/out of presenter view
- Presenter view slide notes text size and scrolling (not sure this is possible)
- Save slide as wallpaper
- Load presentation using filename/path
- Select and play a named slide show

## Credits

This project was inspired by the following:

- https://www.irisdown.co.uk/rsc.html - the OG PowerPoint API
- https://github.com/benkuper/PowerPoint-OSC
- https://github.com/leonreucher/powerpoint-remote-websocket

I'd also like to thank the members of the [Companion User Group](https://www.facebook.com/groups/companion) on Facebook for their ideas and suggestions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
