# PressurePlateDoor_AlwaysOn

`PressurePlateDoor_AlwaysOn` is a stage function that creates a door triggered by a pressure plate. Unlike `PressurePlateDoor`, this door **never reverts**—once it fades out after being activated, it stays open permanently.

---

## Required Parts

- **PressurePlate** – The button or plate that triggers the door when pressed.  
- **PressureDoor** – The door that fades out permanently when triggered.  
- **MoveCube** – The object or cube that activates the pressure plate.  

---

## Installation

1. Add the `PressurePlateDoor_AlwaysOn` module to your stage’s `StageFunctions` folder.  
2. Ensure `RunFunctions` is present and can reference the parts correctly.  

---

## Usage

1. Place the **PressurePlate** part in your stage. 
2. Position the **PressureDoor** that should fade out permanently somewhere.  
3. Place the **MoveCube** that will trigger the plate.  
4. Reference them in `RunFunctions` like this:

```lua
local stage = script.Parent.Parent

local PressurePlateDoor_AlwaysOn = require(script.Parent:WaitForChild("PressurePlateDoor_AlwaysOn"))
PressurePlateDoor_AlwaysOn:SetupPressurePlatePermanent(stage)

```
### Custom Parts
If you do not wish to use the names given by default you can change that by modifing the function:
```lua
PressurePlateDoor_AlwaysOn:SetupPressurePlate(stage, "CustomPlate", "BigDoor", "HeavyCube")
```
