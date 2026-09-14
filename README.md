# CharDisplay
**CharDisplay** (by Roxi) is a small helper for any Figura avatar to use that displays what character you are typing while in chat.
## How do I download this??
Click `<> Code`, `Download ZIP` in the top right above the commit counter. 
## How to use
1. Copy the `chardisplay.lua` file into your avatar, and (if wanted) open it in your IDE of choice (if you don't have one, I recommend you use [Visual Studio Code](https://code.visualstudio.com) or [VSCodium](https://vscodium.org))
2. (optional) Change the `superparent` variable to create a ModelPart to use as the anchor for the TextTask
3. (if not creating a new part from the script) Open the `model.bbmodel` file included in the example avatar in Blockbench and copy the CharTyped group into your avatar

## Important notes
- If you are not creating a new ModelPart from the script, make sure it at least exists in your avatar's model.
- CharDisplay may conflict with your nameplate if you have the default one or a TextTask at the same level of the default nameplate. You can modify where CharDisplay will show by modifying the `:setPos()` instruction's values.

## Licensing
[**Creative Commons Attribution-NonCommercial-ShareAlike 4.0**](https://creativecommons.org/licenses/by-nc-sa/4.0/)  
<ins>Exception: FiguraMC Verified Creators may use this script in paid avatars or commissions sold through the official FiguraMC Discord.</ins> *But please do tell me if you do use it like that.*
