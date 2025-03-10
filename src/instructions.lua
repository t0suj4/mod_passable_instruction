


-- Local references for shorter names and avoiding global lookup on every use
local GetCoord = InstGetCoord

data.instructions.mod_passable_passable = {
    func = function(comp, state, cause, coordinate, impassable, passable)
        local faction = comp.faction
        local loc = GetCoord(comp, state, coordinate)
        if loc and faction:IsVisible(loc) then
            -- Try placing scout frame
            if faction:CanPlace("f_bot_1s_as", loc.x, loc.y, 0, nil, true) then
                state.counter = passable
            else
                state.counter = impassable
            end
        end
    end,
    args = {
        { "in", "Coordinate", "The VISIBLE coordinate to check for whether it's passable", "coord" },
        { "exec", "Impassable", "Something is blocking unit movement at this coordinate"},
        { "exec", "Passable", "Units can pass through this coordinate" }
    },
    name = "Is passable [PASSABLE]",
    desc = "Checks whether a VISIBLE coordinate can be passed through",
    category = "Move",
    icon = "Main/skin/Icons/Special/Commands/Count Free Space.png",
}