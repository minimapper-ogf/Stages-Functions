# AwardBadgeOnTouch

`AwardBadgeOnTouch` is a module designed for stage creators who want to reward players with a badge when they reach a specific point in their stage.


## Features

- Automatically awards a badge to the player when they reach a designated part in the stage.


## Installation

1. Add the `AwardBadgeOnTouch` module to your stage's `LocalFunctions` folder.
2. Include the `RunFunctions` file that comes with the module.

## Usage

1. Define the part in your stage where the badge should be awarded.
2. Specify the badge ID you want to give to the player.
3. Use the `RunFunctions` helper to reference the part and badge ID easily:

```lua
RunFunctions(stage.PARTNAME, BADGEID)
