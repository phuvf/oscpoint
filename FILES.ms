# OSCPoint file handling

> [!WARNING]
> OSCPoint v2.x has the ability to read and share data from the PowerPoint machine's local file system. While this can be useful in live show environments, it's also a very powerful tool that could be used maliciously by users on the same network as your PowerPoint machine.
> 
> Be aware of the capabilities and limitations of this feature before enabling it via the OSCPoint settings tab.

## General description

OSCPoint can read and share presentation file info from a single nominated folder (called the **active folder**) on the PowerPoint machine's local file system.

This allows a remote user to command OSCPoint to open and close PowerPoint presentations stored locally on the PowerPoint machine, which can be useful in live show situations.

### Capabilities

- Read the filenames of all PowerPoint presentations in the active folder, and share these via OSC.
- Open (and close) PowerPoint presentations contained in the active folder by filename.
- The active folder can be changed via OSC.

### Limitations

- Does not support opening presentations from subfolders within the active folder.
- The active folder is always relative to the user's home directory.
- Only `.ppt` and `.pptx` files are supported. All other file types will be ignored.

## Enabling file handling

File handling is disabled by default in OSCPoint. To enable it, go to the OSCPoint settings tab and check the box next to *Enable file system access*.

For security reasons, this feature is disabled by default.

## Setting the active folder

By default, the active folder is set to `Desktop\oscpoint`. This folder is created on the user's Desktop when file handling is enabled.

 To change the active folder, send the following OSC message:

```/oscpoint/files/setpath [string: path]```

The active folder is always relative to the user's home directory. For example, setting the active folder to `Desktop\myfolder\oscpoint` will mean OSCPoint will look for PowerPoint presentations in `C:\Users\[USERNAME]\Desktop\myfolder\oscpoint`.

If this folder does not exist, it will be created.

## Getting a list of presentations in the active folder

OSCPoint will send a list of all presentations in the active folder as an OSC message when the active folder is set. A list can also be requested at any time by sending the following OSC message:

- ```/oscpoint/files/list```

OSCPoint will respond with a message in the following format:

- ```/oscpoint/v2/files [string: JSON array of PowerPoint files]```  
  
An example of the JSON structure is:  
```JSON
[
  {
    "name": "test.pptx",
    "fullName": "C:\\Users\\[USERNAME]\\Desktop\\oscpoint\\test_presentation.pptx",
    "extension": ".pptx",
    "length": 265299837,
    "lastAccessTime": "23/04/2024 13:05:22",
    "lastWriteTime": "23/04/2024 09:45:52",
    "creationTime": "23/04/2024 09:45:51",
    "isReadOnly": false
  },
  {
    "name": "test2.pptx",
    "fullName": "C:\\Users\\[USERNAME]\\Desktop\\oscpoint\\test_presentation_2.pptx",
    "extension": ".pptx",
    "length": 54547477,
    "lastAccessTime": "23/04/2024 12:31:57",
    "lastWriteTime": "23/04/2024 09:57:25",
    "creationTime": "23/04/2024 09:57:25",
    "isReadOnly": false
  }
]
```

## Opening a presentation

To open a presentation, send the following OSC message:

- ```/oscpoint/files/open [string: filename]```

Where `filename` is the name of the presentation file to open. The filename must match exactly with one of the filenames in the active folder.

## Closing a presentation

To close an open presentation, send the following OSC message:

- ```/oscpoint/files/close [string: filename]```

This will close the presentation with name `filename`. If this presentation is not open, the message will be ignored.

Use the information from the `/oscpoint/v2/presentations` message to get the list of currently open presentations.
