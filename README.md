# OSCPoint -  an OSC API for PowerPoint

> [!WARNING]
> OSCPoint is still under active development, and has not reached a beta-stage yet. There are likely to be bugs, and the API may change without warning.
> 
> **DO NOT USE ON PRODUCTION SYSTEMS**
>
> If you give this a go, please share your feedback and issues using the [issue tracker on GitHub](https://github.com/phuvf/oscpoint/issues).
>
> OSCPoint will eventually need a BitFocus Companion module to accompany it. This is not available yet - if you'd like to start developing one, get in touch!

OSCPoint is a PowerPoint add-in that allows Open Sound Control (OSC) control of PowerPoint on Windows. It's primarily designed to be used with BitFocus Companion, but should work with any OSC client that can send and receive OSC messages over UDP.

It's designed to be used with PowerPoint 2016 or later, but may work with earlier versions.

## Support

OSCPoint is developed by [Nick Roberts](https://github.com/phuvf). My day job is head of development for [OctoCue](https://octocue.com), so the OSCPoint PowerPoint add-in uses OctoCue's code signing certificate, in exchange for a bit of brand exposure.

If you have questions or find bugs please use the [issue tracker on GitHub](https://github.com/phuvf/oscpoint/issues).

For feature requests, please check the [Roadmap](#roadmap) section below, and if your idea isn't there, please [raise an issue](https://github.com/phuvf/oscpoint/issues/new?labels=enhancement&template=feature_request.md) on GitHub.

If you find this project useful, consider buying me a coffee:

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/X8X073GQ3)

I'm always looking for interesting ideas to work on - check out my [GitHub profile](https://github.com/phuvf) to see if I might be a good match for your project.

## Capabilites and limitations

OSCPoint allows you to control PowerPoint using **actions**, and get information about the state of PowerPoint using **feedbacks**. See the [OSC actions](#osc-actions) and [OSC Feedbacks](#osc-feedbacks) sections below for further details.

OSCPoint is not:

- A one-stop GUI for controlling PowerPoint
- Available on plaforms other than Windows

## Downloads

| Date       | Version | Release notes   | Link                                                                             |
| ---------- | ------- | --------------- | -------------------------------------------------------------------------------- |
| 2023-10-31 | 1.0.0.1 | [Change log](./ChangeLog.md) | [Download](https://oscpoint.blob.core.windows.net/downloads/oscpoint-latest.zip) |

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

OSC actions are messages you can send to OSCPoint to control PowerPoint. These must be sent as properly formatted OSC messages and transmitted via UDP.

OSC bundles are supported, but have not been extensively tested.

### Slide control

- `/oscpoint/next`  
Go to next slide (or next slide build) in active slide show.

- `/oscpoint/previous`  
Go to previous slide (or back one slide build) in active slide show.

- `/oscpoint/goto/slide [integer: n]`  
Goto to slide *n*. Will default to first or last slide in *n* is out-of-range.

- `/oscpoint/goto/slide/first`  
Goto to first slide in active slide show.  
*Note: This will go to the first slide in the presentation even if it's hidden. See [this issue](https://github.com/phuvf/oscpoint/issues/1#issue-1968312581) for details.*

- `/oscpoint/goto/slide/last`  
Goto to last slide in active slide show.  
*Note: This will go to the last slide in the presentation even if it's hidden. See [this issue](https://github.com/phuvf/oscpoint/issues/1#issue-1968312581) for details.*

- `/oscpoint/goto/section [string: sectionName]`  
Goto to first slide in section *sectionName*. Will do nothing if *sectionName* is not found.  
*Note: sectionName is case sensitive.*

- `/oscpoint/slide/hide [integer: n]`  
Hide slide *n*. Will do nothing if *n* is out-of-range.  
*Note: Hiding slides while in slide show mode seems to work fine when clicking forward, but they may still be shown if the user clicks back.*

- `/oscpoint/slide/unhide [integer: n]`  
Unhide slide *n*. Will do nothing if *n* is out-of-range.

### Slideshow control

- `/oscpoint/slideshow/start`  
Start slideshow from top (slide 1), based on active (focused) window.

- `/oscpoint/slideshow/end`  
End active slideshow.

- `/oscpoint/slideshow/start/current`  
Start slideshow from current slide, based on active (focused) window.

- `/oscpoint/slideshow/start/section [string: sectionName]`  
Start slideshow from first slide in section *sectionName*. Will do nothing if *sectionName* is not found.

- `/oscpoint/slideshow/black [optional integer: n]`  
Sets black screen overlay. *n* = 1 black on, *n* = 0 black off. If no integer is provided, black screen will toggle.

- `/oscpoint/slideshow/white [optional integer: n]`  
Sets white screen overlay. *n* = 1 white on, *n* = 0 white off. If no integer is provided, white screen will toggle.

- `/oscpoint/slideshow/laserpointer [optional integer: n]`  
Turns on/off virtual laser pointer. *n* = 1 laser on, *n* = 0 laser off. If no integer is provided, laser will toggle.

### Media control

*Due to the way PowerPoint handles media, these actions will only work if you're in slideshow mode and there's a single media element on the current slide.*

- `/oscpoint/media/play`  
- `/oscpoint/media/pause`  
- `/oscpoint/media/playpause`  
Will toggle between play and pause states.

- `/oscpoint/media/stop`  
Stops playback and sets playhead to start of media

- `/oscpoint/media/goto/position [integer n]`  
Move playhead to position *n* in milliseconds. Use negative values to seek backwards from end of clip.  
*Example: `/oscpoint/media/goto/position -10000` will go to the last 10 seconds of the clip.*

- `/oscpoint/media/goto/bookmark/next`  
Move playhead to next bookmark.

- `/oscpoint/media/goto/bookmark/previous`  
Move playhead to previous bookmark

### System control

- `/oscpoint/feedbacks/refresh`  
Resend the most recent feedback values.


<!-- `/oscpoint/slideshow/laserpointer [integer: n]`
Start/stop laser pointer. *n* = 1 laser pointer on, *n* = 0 laser pointer off. -->

## OSC Feedbacks

Feedbacks are the messages OSCPoint sends to your OSC client to tell you about the current state of PowerPoint. They are sent out of OSCPoint as OSC messages via UDP.

### Valid whenever a presentation is open

*Note: These feedbacks will switch values with focus changes if multiple presentations are open.*

- `/oscpoint/presentation/name [string: presentationFileName]`  
Current presentation filename.

- `/oscpoint/presentation/slides/count [integer: n]`  
Total number of slides in presentation.

- `/oscpoint/slideshow/state [string stateName]`  
The current state of the presentation. Possible values are: `edit` or `slideshow` 
  
### Valid only during a slide show

- `/oscpoint/slideshow/currentslide [integer: n]`  
Current slide number (1-based).

- `/oscpoint/slideshow/builds/position [integer: n]`  
The build position of the current slide.

- `/oscpoint/slideshow/builds/count [integer: n]`  
The total number of builds on the current slide.

- `/oscpoint/slideshow/builds/remaining [integer: n]`  
The number of builds remaining on the current slide.

- `/oscpoint/slideshow/section/index [integer: n]`  
Current section index (1-based).

- `/oscpoint/slideshow/section/name [string: sectionName]`  
Current section name.

- `/oscpoint/slideshow/notes [string: notesText]`  
Current slide notes (ASCII encoding). Line breaks are normally sent as CR, ASCII 13 (0D in hex).  
*Note: There's a limit to the length of notes that can be returned by OSC over UDP. I'm not sure exactly what this is (probably limited by the maximum packet size of 64k), but I've tested up to 32,000 characters and notes strings longer than this will be truncated. That's a lot of notes.*

### Valid only during a slideshow, and when there's a media element on the current slide

*Please also see the note about media in the **actions** section above - all the same caveats apply here*

These OSC messages will be emitted once every 500ms while the media is in the `playing` state.

- `/oscpoint/slideshow/media/state [string: stateName]`  
The current state of the media element. Possible values are: `playing`, `paused`, `stopped`, `notready`

- `/oscpoint/slideshow/media/duration [integer: n]`  
The duration of the media in milliseconds.

- `/oscpoint/slideshow/media/position [integer: n]`  
The current position of the media playhead in milliseconds.

- `/oscpoint/slideshow/media/remaining [integer: n]`  
The remaining playtime of the media in milliseconds.


## Roadmap

These ideas have been suggested, but are not yet implemented:

- Feedback for when a slide transition is running
- Screen switching in/out of presenter view
- Presenter view slide notes text size and scrolling (not sure this is possible)
- Save slide as wallpaper
- Load presentation using filename/path
- Select and play a named slide show
- Add better logging

## Credits

This project was inspired by the following:

- https://www.irisdown.co.uk/rsc.html - the OG PowerPoint API
- https://github.com/benkuper/PowerPoint-OSC
- https://github.com/leonreucher/powerpoint-remote-websocket

I'd also like to thank the members of the [Companion User Group](https://www.facebook.com/groups/companion) on Facebook for their ideas and suggestions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
