# PressurePlateDoor

`PressurePlateDoor` is a stage function used to create interactive doors triggered by pressure plates. When a cube is placed on the pressure plate, the associated door will fade out, allowing the player to progress.

---

## Required Parts

- **PressurePlate** – The button that the player (or object) interacts with.  
- **PressureDoor** – The door that fades out when triggered.  
- **MoveCube** – The object that can be placed on the pressure plate to activate the door.  

---

## Installation

1. Place the `PressurePlateDoor` module into your stage's `StageFunctions` folder.
2. Make sure `RunFunctions` is present and accessible to execute the function.

---

## Usage

1. Place the **PressurePlate** part in your stage. 
2. Position the **PressureDoor** that should fade out permanently somewhere.  
3. Place the **MoveCube** that will trigger the plate.  
4. Reference them in `RunFunctions` like this:

```lua
local stage = script.Parent.Parent

local PressurePlateDoor = require(script.Parent:WaitForChild("PressurePlateDoor"))
PressurePlateDoor:SetupPressurePlate(stage)

```
### Custom Parts
If you do not wish to use the names given by default you can change that by modifing the function:
```lua
PressurePlateDoor_AlwaysOn:SetupPressurePlate(stage, "CustomPlate", "BigDoor", "HeavyCube")
```
