require "Entity/ISEntityUI"

PortableCraftingSurface = PortableCraftingSurface or {}

PortableCraftingSurface.types = {
    "Base.CuttingBoardWooden",
    "Base.CuttingBoardPlastic",
}

function PortableCraftingSurface.hasSurface(_player)
    if not _player then return false end
    if _player:getVehicle() then return false end

    local inventory = _player:getInventory()
    if not inventory then return false end

    for i = 1, #PortableCraftingSurface.types do
        if inventory:containsTypeRecurse(PortableCraftingSurface.types[i]) then
            return true
        end
    end

    return false
end

function PortableCraftingSurface.getSurfaceObject(_player)
    local square = _player:getSquare()
    if not square then return nil end
    return square:getFloor()
end

local FindCraftSurface = ISEntityUI.FindCraftSurface

---@diagnostic disable-next-line: duplicate-set-field
function ISEntityUI.FindCraftSurface(_player, _radius)
    local object = FindCraftSurface(_player, _radius)
    if object then return object end
    if not PortableCraftingSurface.hasSurface(_player) then return nil end
    return PortableCraftingSurface.getSurfaceObject(_player)
end
