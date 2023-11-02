# OSC Feedbacks

Feedbacks are the messages OSCPoint sends to your OSC client to tell you about the current state of PowerPoint. They are sent out of OSCPoint as OSC messages via UDP.

## Valid whenever a presentation is open

*Note: These feedbacks will switch values with focus changes if multiple presentations are open.*

- `/oscpoint/presentation/name [string: presentationFileName]`  
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

- `/oscpoint/slideshow/section/name [string: sectionName]`  
Current section name.

- `/oscpoint/slideshow/notes [string: notesText]`  
Current slide notes (ASCII encoding). Line breaks are normally sent as CR, ASCII 13 (0D in hex).  
*Note: There's a limit to the length of notes that can be returned by OSC over UDP. I'm not sure exactly what this is (probably limited by the maximum packet size of 64k), but I've tested up to 32,000 characters and notes strings longer than this will be truncated. That's a lot of notes.*

## Valid only during a slideshow, and when there's a media element on the current slide

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