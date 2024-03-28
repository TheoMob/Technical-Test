function printSmallGuildNames(memberCount)
  -- this method is supposed to print names of all guilds that have less than memberCount max members
  local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d ORDER BY max_members ASC;" -- changed the SQL query as to guarantee a good organization, specially since this information is going to be printed
  local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))

  if resultId then -- test if there is indeed any guild that meets the memberCount requeriment
    repeat -- loop to print each guild's name, the previous code would only print the first guild name
      local guildName = resultId.getString("name") -- changed 'result' to 'resultId' since result was unknown variable
      print(guildName)
    until not resultId.next(resultId)
  else
    print("No guilds found.")
  end
end
