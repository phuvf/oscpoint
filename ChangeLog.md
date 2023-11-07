# OSCPoint Change log
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
- Better data resetting on slideshow end
- Better media object handling

## 1.0.0.6

- Better media object handling
- Better feedback resetting at end of slideshow

## 1.0.0.5

- Fixed issue where having no named sections in show file caused feedbacks to break
  
## 1.0.0.2

- Added logging tools
- Fixed issue where current slide was not being set correctly

## 1.0.0.1

- Started change log
- Added `laserpointer` action
- Removed internal `validActions` checking as no longer required
- Capped length of returned notes string to 32,000 charaters
- Added argument type checking to OSC actions
- Added *About* dialog to ribbon so version checking possible.


## 1.0.0.0

Released 2023-10-30

- Initial release
