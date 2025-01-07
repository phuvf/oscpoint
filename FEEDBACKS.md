# OSC Feedbacks

Feedbacks are the messages OSCPoint sends to your OSC client to tell you about the current state of PowerPoint. They are sent out of OSCPoint as OSC messages via UDP.

> [!NOTE] 
> 
> Feedbacks starting with `/oscpoint/v2/` are new in version 2.x of OSCPoint. UTF-8 support requires v3.x.

## Valid at any time

- `/oscpoint/v2/event [string: eventType] [args]`  
See [EVENTS.md](EVENTS.md) for a full list of events and arguments from this message.

- `/oscpoint/v2/presentations [string: JSON array of presentation objects]`  
List of all presentations currently open in PowerPoint. Includes the name, path, slide count, and whether the presentation is saved and in slide show mode. Also includes a full list of the individual sections that make up the presentation.  
For an example of the JSON structure, see [PRESENTATION.md](PRESENTATION.md).

- `/oscpoint/v2/presentation [string: JSON presentation object ASCII] [blob: JSON presentation object UTF-8]`
The current presentation object. Includes the name, path, slide count, and whether the presentation is saved and in slide show mode. Also includes a full list of the individual sections that make up the presentation.  
If no presentation is open, this message include a blank presentation object:  
    ```json
    {"name":"","path":"","slideCount":0,"saved":false,"active":false,"slideshow":false,"sections":null}
    ```
- `/oscpoint/v2/files/enabled [boolean]`  
  Reports whether OSCPoint has permission to access the file system of the PowerPoint machine. This can only be enabled via the OSCPoint ribbon in PowerPoint.

- `/oscpoint/v2/files/activefolder [string: path ASCII] [blob: path UTF-8]`  
  The path to the OSCPoint folder, relative to the user's home directory. For more details about this feature, see [FILES.md](FILES.md).

- `/oscpoint/v2/files/activefolder/fullpath [string: path ASCII] [blob: path UTF-8]`  
  The full path to the OSCPoint folder. For more details about this feature, see [FILES.md](FILES.md).



## Valid whenever a presentation is open

*Note: These feedbacks will switch values with focus changes if multiple presentations are open.*

- `/oscpoint/presentation/name [string: presentationFileName ASCII] [blob: presentationFileName UTF-8]`  
Current presentation filename.

- `/oscpoint/presentation/slides/count [integer: n]`  
Total number of slides in presentation.

- `/oscpoint/slideshow/state [string stateName]`  
The current state of the presentation. Possible values are: `edit` or `slideshow` 
  
## Valid only during a slide show

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

- `/oscpoint/slideshow/section/name [string: sectionName ASCII] [blob: sectionName UTF-8]`  
Current section name.

- `/oscpoint/slideshow/notes [string: notesText]`  
Current slide notes (ASCII encoding). Line breaks are normally sent as CR, ASCII 13 (0D in hex).  

- `/oscpoint/slideshow/notes-utf8 [blob: notesText UTF-8]` ![v2.0.2+ required](https://img.shields.io/badge/v2.0.2%2B-be3412)  
Current slide notes in UTF-8 encoding. This is sent as raw bytes and will need decoding by your OSC client.

> [!NOTE] 
> Use ASCII encoded notes for  quick, easy reading.  
> Use UTF-8 encoded notes for full international character support, but you'll have to do the decoding yourself - or use the Companion Module, which does this for you.  
> To avoid busting UDP packet size limits, notes longer than 32,000 characters this will be truncated (that's a lot of notes).

## Valid only during a slideshow, and when there's a media element on the current slide

*Please also see the note about media in [ACTIONS.md](ACTIONS.md) - all the same caveats apply here*

These OSC messages will be emitted once every 500ms while the media is in the `playing` state.

- `/oscpoint/slideshow/media/state [string: stateName]`  
The current state of the media element. Possible values are: `playing`, `paused`, `stopped`, `notready`

- `/oscpoint/slideshow/media/duration [integer: n]`  
The total duration of the media clip in milliseconds.

- `/oscpoint/slideshow/media/durationtrimmed [integer: n]` ![v2.1+ required](https://img.shields.io/badge/v2.1%2B-be3412)  
The trimmed duration of the media clip in milliseconds (from the clip's start point to the clip's end point).  
This will be the same as the total duration if the media clip has not been trimmed.

- `/oscpoint/slideshow/media/startpoint [integer: n]` ![v2.1+ required](https://img.shields.io/badge/v2.1%2B-be3412)  
The start point of the media clip in milliseconds, measured from the start of the full clip.  
Will be 0 if the media clip has not been trimmed.

- `/oscpoint/slideshow/media/endpoint [integer: n]` ![v2.1+ required](https://img.shields.io/badge/v2.1%2B-be3412)  
The end point of the media clip in milliseconds, measured from the start of the full clip.  
Will be the same as the total duration if the media clip has not been trimmed.

- `/oscpoint/slideshow/media/position [integer: n]`  
The current position of the media playhead in milliseconds, measured from the start point.

- `/oscpoint/slideshow/media/remaining [integer: n]`  
The remaining playtime (up to the end point) of the media in milliseconds.

> [!NOTE]
> Media feedbacks do not currently (as of add-in v2.0.x) report correctly if a media file has been trimmed in PowerPoint. 
> They will report the full duration of the media file, not the trimmed duration.
> This is a known issue and will be addressed in a future release.
