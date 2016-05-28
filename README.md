[![Slack Room][slack-badge]][slack-link]

# iterm_control

Using [escape sequences](https://en.wikipedia.org/wiki/Escape_sequence) **iTerm2** can be [controlled](https://www.iterm2.com/documentation-escape-codes.html) from **fish-shell** - in some aspects.

This plugin wraps around the  escape codes to give some comfort:

* Change __some__ colors
* Set title of tab
* Set marks on the buffer
* Change cursor shape
* Adjust color of the *chrome* (title and tab bar colors)

## Security

*Changing colors* and *setting marks* should not be an issue.

But [the code](https://github.com/gnachman/iTerm2/blob/master/sources/iTermAdvancedSettingsModel.m) reads:

> Disable potentially insecure escape sequences
> RemoteHost, StealFocus, CurrentDir, SetProfile, CopyToClipboard, EndCopy, File, SetBackgroundImageFile

While the supplied functions for `SetProfile` and `StealFocus` work if the related setting (*Advanced: Disable potentially insecure escape sequences*) is not enabled it is recommended to leave these **cosmetical** set of **dangerous** features of. Therefore, they are commented out.

> What is dangerous? There might be bugs lurking in the *iTerm2* codebase - this is why the actual authors allow to keep it disabled.

## Install

With [fisherman]

```
fisher fishgretel/iterm_control
```

## Usage

While `iterm_set_mark` can be called as a *function* it is recommended to `emit` [events](http://fishshell.com/docs/current/#event):

```fish
emit iterm_set_mark
```

> Personally, i consider this feature to be most useful.

Change cursor to _vertical bar_:

```fish
iterm_set_cursor_shape 1
```

Change _title_ and _tab bar_ to red, like when an error occurs:

```fish
iterm_set_chrome 196 000 000
sleep 1
iterm_reset_chrome
```

Switch the background color in accordance to day or night time:

```
iterm_set_tab_title 'day'
iterm_set_background f0f0f0
iterm_set_foreground 040404
sleep 5 # alien planet has a daycycle of 5 seconds
iterm_set_tab_title 'night'
iterm_set_background 040404
iterm_set_foreground ffffff
```

Well, at least something. As stated above only `SetProfile` would allow changing the color theme as set by each profile.

> Security-wiese folks might code-audit [iTerm2](https://github.com/gnachman/iTerm2) so these features could be enabled with less risk.

[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg

[fisherman]: https://github.com/fisherman/fisherman
