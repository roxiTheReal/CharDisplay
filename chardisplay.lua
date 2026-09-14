--#region "Information"
--     ____             _
--    / __ \____  _  __(_)
--   / /_/ / __ \| |/_/ /
--  / _, _/ /_/ />  </ /
-- /_/ |_|\____/_/|_/_/
--

-- CharDisplay v0.1.0 (probably final version)
-- https://github.com/roxiTheReal/chardisplay
--#endregion

--#region "Configuration"
superparent = models.model.root.Head.CharTyped:setScale(0.3) -- ModelPart to use as anchor for the TextTask's parent, you can create one instead
superparent:moveTo(models.model.root):setPos(0,13.5,0)
parent = superparent:newPart("charbillboard","CAMERA")
--#endregion

--#region "the actual shit"
typedchar = parent:newText("typedchar")
    :setAlignment("CENTER")
    :setVisible(false)

local counter = 0
local typingCursor = {
    "_",
    " "
}
local iterations = 0
local currCursor = ""

local lastChar = ""

local isTyping = false

function pings.updateChar(typed)
    lastChar = typed
end

function pings.toggleTyper(bool)
    typedchar:setVisible(bool)
end

function pings.setTyping(bool) isTyping = bool end

function events.tick()
    if counter == 10 then
        counter = 0
        iterations = iterations + 1
    end
    counter = counter + 1
    currCursor = typingCursor[(iterations % 2) + 1]
    typedchar
        :setText(toJson({text = ":speech_bubble_animated: " .. lastChar .. currCursor, bold = true}))
        :setOutline(true)
end

if host:isHost() then
    local _isTyping = false

    function events.tick()
        _isTyping, isTyping = isTyping, host:isChatOpen()
        if _isTyping ~= isTyping then 
            pings.setTyping(isTyping) 
            pings.toggleTyper(isTyping)
            if not isTyping then
                pings.updateChar("")
            end
        end
    end
end


function events.CHAR_TYPED(c)
    if not isTyping then return end
    if not host:isHost() then return end
    local chatText = host:getChatText()
    if chatText:find("^/") then
        return
    else
        pings.updateChar(c)
    end
end

function events.KEY_PRESS(k)
    if k == 259 then
        pings.updateChar("")
    end
end
--#endregion
