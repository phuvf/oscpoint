# OSCPoint actions

OSC actions are messages you can send to OSCPoint to control PowerPoint. These must be sent as properly formatted OSC messages and transmitted via UDP.

OSC bundles are supported, but have not been extensively tested.

> [!NOTE] 
> OSC string arguments only support ASCII characters - so as of v3.0.0 it's possible to send UTF-8 strings as encoded binary blobs. When OSCPoint receives a message it'll detect the type of argument being sent, and any binary blob data will be assumed to be UTF-8 encoded text.  
> Send either a string or a blob - not both!

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

- `/oscpoint/goto/section [string: sectionName (ASCII)] OR [blob: sectionName (UTF-8)]`   
Goto to first slide in section *sectionName*. Will do nothing if *sectionName* is not found.  
*Note: sectionName is case sensitive. UTF-8 support requires v3+.*

- `/oscpoint/slide/hide [integer: n]`  
Hide slide *n*. Will do nothing if *n* is out-of-range.  
*Note: Hiding slides while in slide show mode seems to work fine when clicking forward, but they may still be shown if the user clicks back.*

- `/oscpoint/slide/unhide [integer: n]`  
Unhide slide *n*. Will do nothing if *n* is out-of-range.

## Slide show control

- `/oscpoint/slideshow/start`  
Start slideshow from top (slide 1), based on active (focused) window.

> [!NOTE] 
> As of v2.0.0 an optional integer can be added to start from a specific slide - for example `/oscpoint/slideshow/start [Integer: 5]` to start at slide 5.

- `/oscpoint/slideshow/end`  
End active slide show.

- `/oscpoint/slideshow/start/current`  
Start slideshow from current slide, based on active (focused) window.

- `/oscpoint/slideshow/start/section [string: sectionName]`  
Start slideshow from first slide in section *sectionName*. Will do nothing if *sectionName* is not found.

> [!NOTE]
> If you're not starting a slideshow from the top of the deck, you may see a flash of slide 1 before the correct slide is shown.  
> This is a limitation of the PowerPoint object model - set slide 1 to be black to hide this, if necessary. 

- `/oscpoint/slideshow/black [optional integer: n]`  
Sets black screen overlay. *n* = 1 black on, *n* = 0 black off. If no integer is provided, black screen will toggle.

- `/oscpoint/slideshow/white [optional integer: n]`  
Sets white screen overlay. *n* = 1 white on, *n* = 0 white off. If no integer is provided, white screen will toggle.

- `/oscpoint/slideshow/laserpointer [optional integer: n]`  
Turns on/off virtual laser pointer. *n* = 1 laser on, *n* = 0 laser off. If no integer is provided, laser will toggle.

- `/oscpoint/slideshow/setwallpaper [optional integer: width px] [optional integer: height px]` ![v2.0.0+ required](https://img.shields.io/badge/v2.0.0%2B-be3412)  
Sets the current slide as the desktop wallpaper.
  - Exports current slide to temporary folder at resolution `width` x `height` px. Will default to 1920x1080 if no width and height are provided.
  - Sets exported image as fill-style wallpaper for all monitors on machine.

## Media control

*Due to the way PowerPoint handles media, these actions will only work if you're in slideshow mode and there's a single media element on the current slide.*

- `/oscpoint/media/play`  
- `/oscpoint/media/pause`  
- `/oscpoint/media/playpause`  
Will toggle between play and pause states.

- `/oscpoint/media/stop`  
Stops playback and sets playhead to start of media

- `/oscpoint/media/goto/position/fromstart [integer: n]`  
Move playhead to position *n* milliseconds from start of clip.

- `/oscpoint/media/goto/position/beforeend [integer: n]`    
Move playhead to position *n* milliseconds before end of clip.

- `/oscpoint/media/goto/position/forward [integer: n]`  
Move playhead forward *n* milliseconds from current position.
  
- `/oscpoint/media/goto/position/back [integer: n]`  
Move playhead backward *n* milliseconds from current position.

- `/oscpoint/media/goto/position/percent [float: f]`  
Move playhead to position *f* percent from start of clip.

- `/oscpoint/media/goto/bookmark/next`  
Move playhead to next bookmark.

- `/oscpoint/media/goto/bookmark/previous`  
Move playhead to previous bookmark

## File control

> [!NOTE] 
> The *Allow file system access* setting must be enabled in the OSCPoint tab on settings for these actions to work.
> For security reasons, this can only be enabled locally on the PowerPoint machine.

- `/oscpoint/files/setpath [string: path (ASCII)] OR [blob: path (UTF-8)]` ![v2.0.0 + required](https://img.shields.io/badge/v2.0.0%2B-be3412)  
Set active folder to *path*, relative to user folder. For example, setting the active folder to `Desktop\myfolder\oscpoint` will mean OSCPoint will look for PowerPoint presentations in `C:\Users\[USERNAME]\Desktop\myfolder\oscpoint`.
If this folder does not exist, it will be created.
*Note: UTF-8 support requires v3+*

- `/oscpoint/files/list` ![v2.0.0 + required](https://img.shields.io/badge/v2.0.0%2B-be3412)  
Prompt OSCPoint to return a `/oscpoint/v2/files` message with details of files in active folder

- `/oscpoint/files/open [string: filename (ASCII)] OR [blob: filename (UTF-8)]` ![v2.0.0 + required](https://img.shields.io/badge/v2.0.0%2B-be3412)  
Open file (in active folder) with name *filename*. Only files ending in `.ppt` and `.pptx` are supported. Will switch to open presentation if file is already open.  
*Note: UTF-8 support requires v3+*

- `/oscpoint/presentations/activate [string: filename (ASCII)] OR [blob: filename (UTF-8)]` ![v2.0.0 + required](https://img.shields.io/badge/v2.0.0%2B-be3412)  
Switch to open presentation with name *filename*. If file is not open, will do nothing. Note that this action does not require file access permissions, unlike the `/oscpoint/files/open` action.  
*Note: UTF-8 support requires v3+*

### Closing a file

When closing a file with unsaved changes, a decision needs to be made as to what action to take. 

> [!WARNING] 
> The `/oscpoint/files/close` group of actions can overwrite files and/or lose unsaved file edits without warning. Use with caution.

- `/oscpoint/files/close [optional string: filename (ASCII)] OR [optional blob: filename (UTF-8)]` ![v2.0.1+ required](https://img.shields.io/badge/v2.0.1%2B-0e3412)  
Close open presentation *filename*, or the active presentation if no filename specified.  
Action when file has unsaved changes:  **abort**  - action will cancel and file will not close. It is not generally advise to use this method - see note below for more details.  
*Note: UTF-8 support requires v3+*

- `/oscpoint/files/close/force [optional string: filename (ASCII)] OR [optional blob: filename (UTF-8)]` ![v2.0.1+ required](https://img.shields.io/badge/v2.0.1%2B-0e3412)  
Close open presentation *filename*, or the active presentation if no filename specified.  
Action when file has unsaved changes:  **force close**  - unsaved changes are discarded and file is closed.  
*Note: UTF-8 support requires v3+*

- `/oscpoint/files/close/save [optional string: filename (ASCII)] OR [optional blob: filename (UTF-8)]` ![v2.0.1+ required](https://img.shields.io/badge/v2.0.1%2B-0e3412)  
Close open presentation *filename*, or the active presentation if no filename specified.  
Action when file has unsaved changes:  **save and close**  - unsaved changes are saved and file is closed. This will overwrite the existing file.
*Note: UTF-8 support requires v3+*

>[!NOTE]
> Due to the way OSCPoint calculates the starting slide information, starting a slide show will cause the file to be maked as unsaved.


## System control

Most of these actions adjust settings that can also be configured using the **OSCPoint** tab on the ribbon in PowerPoint.

- `/oscpoint/actions/enable`  
Enable OSC actions.

- `/oscpoint/actions/disable`  
Disable OSC actions. All messages (except `/oscpoint/actions/enable`) will be ignored.

- `/oscpoint/feedbacks/enable`  
Enable OSC feedbacks.  
Will also trigger a refresh of all feedbacks.

- `/oscpoint/feedbacks/disable`  
Disable OSC feedbacks.

- `/oscpoint/feedbacks/refresh`  
Resend the most recent feedback values.
