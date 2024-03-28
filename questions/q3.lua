function remove_party_member(playerId, membername)
  local party = Player(playerId):getParty() -- since the 'player' variable was only used here and could cause confusion with 'Player', i removed it to improve the code's readability, this could be a problem if the 'player' needed to be used subsequently, but that's not the case within the context of the question

  for _,partyMember in pairs(party:getMembers()) do -- changed v to partyMember to improve readability
    if partyMember == Player(membername) then
      party:removeMember(Player(membername))
      return -- since the player 'membername' was already removed, there's no need to keep doing the loop or the code, if something was to be executed after the loop, this 'return' could be switched to a 'break'
    end
  end
end