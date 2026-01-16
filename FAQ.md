# OSCPoint FAQ

## Is there a version for macOS? Will there ever be?

> [!Note]
> The answer is basically no - read more below if you want to find out why.

OSCPoint works by hooking into the **PowerPoint Object Model** - a VBA & C# interface that's part of Office on Windows. You can explore this here: https://learn.microsoft.com/en-us/office/vba/api/overview/powerpoint/object-model

However, it also uses a bunch of platform-specific features that aren't available on macOS

Here's a (slightly tidied up) analysis from CoPilot:

> Key Issues for macOS Compatibility:
>
> 1. VSTO Technology: OSCPoint is a VSTO (Visual Studio Tools for Office) add-in and requires the Visual Studio Tools for Office Runtime, which is Windows-only
> 2. COM Interop: OSCPoint Uses Microsoft.Office.Interop.PowerPoint for direct COM interaction with PowerPoint, which is not available on macOS
> 3. .NET Framework 4.7.2: OSCPoint is built on .NET Framework (Windows-only), not .NET Core/.NET 5+
>
> Other platform-specific features:
> - Windows Forms dependencies (System.Windows.Forms)
> - Windows-specific registry and file system access patterns
> - COM-based ribbon customization (IRibbonExtensibility)
>
> Other considerations:
> - A macOS version would have different code-signing requirements - maybe a new code signing certificate would be required?

I'm not saying that it's impossible to write a tool similar to OSCPoint for PowerPoint on macOS - just that's it's a whole new challenge I'm not interested in investigating.

If someone else wants to give it a go, they're welcome to use the same OSC schema as OSCPoint - this would mean the Companion module would work with both.
