# OSCPoint sample presentation JSON

OSCPoint uses JSON to represent the state of a presentation. This is a sample JSON object representing a presentation with 48 slides, 3 sections, and the slideshow running.

```JSON
{
  "name": "test_presentation.pptx",
  "path": "C:\\Users\\[USERNAME]\\Desktop\\oscpoint",
  "slideCount": 48,
  "saved": true,
  "active": true,
  "slideshow": true,
  "sections": [
    {
      "id": "{0FD0682D-A8FE-4955-AB04-F07552824B5D}",
      "name": "Default Section",
      "firstSlide": 1,
      "lastSlide": 5,
      "slideCount": 5
    },
    {
      "id": "{ED2008A6-89BF-4DF5-B9D9-493C7E049507}",
      "name": "Financials",
      "firstSlide": 6,
      "lastSlide": 9,
      "slideCount": 4
    },
    {
      "id": "{30ABD9E6-EF6B-43A1-8378-3E37CC4F1495}",
      "name": "Summary",
      "firstSlide": 10,
      "lastSlide": 48,
      "slideCount": 39
    }
  ]
}
```