# Portable Crafting Surface

A Project Zomboid B42 mod: a cutting board in the player's inventory satisfies
the "any surface" crafting requirement, so crafting works away from furniture.

## How it works

Vanilla resolves crafting surfaces in one place, `ISEntityUI.FindCraftSurface()`.
The mod wraps it: the vanilla result is returned unchanged whenever a real
surface is in reach, and only when there is none does it fall back to the
player's own floor tile - a real `IsoObject`, which matters because
`ISHandcraftAction` passes it to the server.

The surface requirement itself is untouched. No recipe tags are modified.

## Layout

    PortableCraftingSurface/          Steam Workshop staging item
      workshop.txt                    upload metadata
      preview.png                     workshop thumbnail (required to publish)
      Contents/mods/                  what actually ships

## Development

Link the mod folder into the game so edits are live:

    mklink /J "%USERPROFILE%\Zomboid\mods\PortableCraftingSurface" ^
      "<repo>\PortableCraftingSurface\Contents\mods\PortableCraftingSurface"

Run the game with `-debug` for the Lua error window. Lua changes can be
reloaded in-game from the debug menu's Lua File Browser; script and `mod.info`
changes need a restart.

## Publishing

Copy or link `PortableCraftingSurface/` into `%USERPROFILE%\Zomboid\Workshop\`,
then use the game's main menu WORKSHOP screen. After the first upload the item
id is written into `workshop.txt` - keep it, or you will create a duplicate.

`workshop-description.txt` is the canonical Steam page text, maintained by hand.
