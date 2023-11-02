# OSCPoint actions

OSC actions are messages you can send to OSCPoint to control PowerPoint. These must be sent as properly formatted OSC messages and transmitted via UDP.

OSC bundles are supported, but have not been extensively tested.

## Slide control

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

## Slideshow control

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

## Media control

*Due to the way PowerPoint handles media, these actions will only work if you're in slideshow mode and there's a single media element on the current slide.*

- `/oscpoint/media/play`  
- `/oscpoint/media/pause`  
- `/oscpoint/media/playpause`  
Will toggle between play and pause states.

- `/oscpoint/media/stop`  
Stops playback and sets playhead to start of media

- `/oscpoint/media/goto/position/fromstart [integer n]`  
Move playhead to position *n* milliseconds from start of clip.

- `/oscpoint/media/goto/position/beforeend [integer n]`    
Move playhead to position *n* milliseconds before end of clip.

- `/oscpoint/media/goto/position/forward [integer n]`  
Move playhead forward *n* milliseconds from current position.
  
- `/oscpoint/media/goto/position/back [integer n]`  
Move playhead backward *n* milliseconds from current position.

- `/oscpoint/media/goto/position/percent [integer n]`  
Move playhead to position *n* percent from start of clip.

- `/oscpoint/media/goto/bookmark/next`  
Move playhead to next bookmark.

- `/oscpoint/media/goto/bookmark/previous`  
Move playhead to previous bookmark

## System control

- `/oscpoint/feedbacks/refresh`  
Resend the most recent feedback values.
