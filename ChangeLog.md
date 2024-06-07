# OSCPoint Change log

## 2.0.0.2

Released 2024-06-04

- Fixed small bug causing section name mis-reporting

## 2.0.0.1

Released 2024-06-01

### System changes


- Changed slide show start logic and internal object model calls to improve performance/avoid flash of slide 1 when starting slide show
- Added file handling system so presentations can be opened/closed on remote machine - see [FILES.md](FILES.md) for details
- Added file access toggle to OSCPoint tab to enable/disable file access. For security reasons, this is off by default.
- OSC messages are now queued and sent as bundles every c.200ms to avoid duplicate and out-of-order messages

> [!NOTE]
> Notes feedback is not bundled - it is sent immediately as it can be a large amount of data that might not survive bundling.

### Actions


- Added ability to start slide show from any slide number using `/oscpoint/slideshow/start [Integer: 5]`
- Added `/oscpoint/slideshow/setwallpaper [optional integer: width px] [optional integer: height px]` command
- Added `setpath`, `list`, `open` and `close` actions for file handling at `/oscpoint/files/[action]`
- Added `activate` action to switch presentations without needing file access permissions

### Feedbacks

- Added  `/oscpoint/v2/event` feedback to allow direct hooking of PowerPoint events. These are not bundled and are sent immediately.
- Added `/oscpoint/v2/presentations` feedback with JSON array of all open presentations
- Added `/oscpoint/v2/presentation` feedback with JSON object of the active presentation

> [!NOTE]
> The JSON presentation object now includes detail of the presentation itself & slide counts , as well as full details of the sections within the presentation.  See [PRESENTATION.md](PRESENTATION.md) for an example JSON object.

## 1.0.1.1

Released 2023-11-05

- Added `/oscpoint/actions/[enable | disable]` and `/oscpoint/feedbacks/[enable | disable]` actions
- Reworked ribbon tab to suit
- Better user input checking for port and host settings
  
## 1.0.1.0

Released 2023-11-03

> [!WARNING]
> Includes breaking change to media position actions

- Reworked media position actions to avoid negative integer issues
- Added %age position action


## 1.0.0.7
- Better data resetting on slide show end
- Better media object handling

## 1.0.0.6

- Better media object handling
- Better feedback resetting at end of slide show

## 1.0.0.5

- Fixed issue where having no named sections in show file caused feedbacks to break
  
## 1.0.0.2

- Added logging tools
- Fixed issue where current slide was not being set correctly

## 1.0.0.1

- Started change log
- Added `laserpointer` action
- Removed internal `validActions` checking as no longer required
- Capped length of returned notes string to 32,000 characters
- Added argument type checking to OSC actions
- Added *About* dialog to ribbon so version checking possible.


## 1.0.0.0

Released 2023-10-30

- Initial release
