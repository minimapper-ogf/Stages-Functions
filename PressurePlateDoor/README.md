# PressurePlateDoor

`PressurePlateDoor` is a stage function used to create interactive doors triggered by pressure plates. When a cube is placed on the pressure plate, the associated door will fade out, allowing the player to progress.

---

## Required Parts

- **PressurePlate** – The button that the player (or object) interacts with.  
- **PressureDoor** – The door that fades out when triggered.  
- **MoveCube** – The object that can be placed on the pressure plate to activate the door.  

---

## Installation

1. Place the `PressurePlateDoor` model into your stage's `StageFunctions` folder.
2. Make sure `RunFunctions` is present and accessible to execute the function.

---

## Usage

1. Position the **PressurePlate** where you want players or cubes to interact.  
2. Set the **PressureDoor** in the position you want to disappear.  
3. Place a **MoveCube** that can trigger the plate.  
4. Reference them in your `RunFunctions` script as needed to activate the interaction.

```lua
RunFunctions(stage.PressurePlate, stage.PressureDoor, stage.MoveCube)
