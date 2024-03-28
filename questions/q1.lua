
local function releaseStorage(player)
  if not player or not player:exists() then -- added a verification to prevent errors, the "player:exists()" should be replaced to the function that verifies players, if there is one
    return
  end

  player:setStorageValue(1000, nil) -- the -1 as a representation of an empty storage can be a valid option, but in general nil is a safer option, it depends on the rest of the system
end

function onLogout(player)
  if player:getStorageValue(1000) then -- assuming many things can be stored into the position 1000, it should be safer to test if it isn't empty, independently of it's content
    addEvent(releaseStorage, 1000, player) -- assuming the 1000 refers to the time in milisseconds that it takes for the event to start, this shouldn't be altered, unless the 1000 should refer to the position in the memory that it wants to release
  end

  return true -- assuming this true is a representation that the logout happened succesfully, then it should be keeped independently of the if statement
end
