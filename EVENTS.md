# OSCPoint event feedback

As of OSCPoint v2.x, selected individual events in PowerPoint are sent as OSC messages.

To received these, feedback needs to be enabled in the OSCPoint add-in settings.

- `/oscpoint/v2/event [string: eventType] [args]`  
Emitted any time an internal event fires in PowerPoint. Possible `eventTypes` and associated `args`  are:

| Event Name              | Arguments                                           | Description                                                                                     |
|-------------------------|-----------------------------------------------------|-------------------------------------------------------------------------------------------------|
| `add_in_startup`          | `Add-in version`                                   | -                                                                                               |
| `presentation_open`       | `Presentation filename`                            | -                                                                                               |
| `presentation_close`      | `Presentation filename`                            | -                                                                                               |
| `window_activate`         | `Presentation filename`                            | Occurs when the application window or any document window is activated.                          |
| `slideshow_next_slide`   | `Slide number`, `Click index`, `Click count`       | Occurs immediately before the transition to the next slide. For the first slide, occurs immediately after the SlideShowBegin event. |
| `slideshow_on_next`      | `Slide number`, `Click index`, `Click count`       | Occurs when the user clicks Next to move within the current slide.                               |
| `slideshow_next_click`   | `Slide number`, `Click index`, `Click count`       | Occurs on the next click of the slide.                                                           |
| `slideshow_next_build`   | `Slide number`, `Click index`, `Click count`       | Occurs upon mouse-click or timing animation, but before the animated object becomes visible.     |
| `slideshow_begin`         | `Presentation filename`, `Slide number`            | Occurs when a slide show starts.                                                                 |
| `slideshow_end`           | `Presentation filename`                            | Occurs when a slide show ends.    