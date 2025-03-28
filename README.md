# hdr-settings-menu
Example settings GUI for games with HDR support

I used the term "**Brightness**" instead of "reference luminance" because this is the correct player-facing term. In my opinion, it does not make sense for a game to present the term "reference luminance" to the player when all it really means is just the overall brightness of the game when using HDR output. I am indifferent on which term is used by Godot scripting/project settings.

**Style A - Simple**
Separate brightness and max luminance controls that default to screen values.

**Style B - Advanced**
Same as "Style A - Simple", but with nits values always presented to the player, even when they have not been customized.

**Style C - Ignore Screen Lum.**
Screen luminance is entirely ignored. For games designed to be played in a home cinema or where the viewing environment's brightness is known in advance.

**Style D - Screen Luminance Toggle**
One toggle switch that controls whether screen luminance is used or custom luminance is used for both brightness and max luminance.

**Style E - Screen Luminance (Saved)**
Same as "Style D - Screen Luminance Toggle", except the player's previous brightness and max luminance values are restored when they turn off "Use screen luminance".

**Style F - Automatic Simple**
"Use screen luminance" is automatically disabled when the user changes either brightness or max luminance. "Use screen luminance" is automatically enabled when the user presses the "Reset" button. My personal favourite style.