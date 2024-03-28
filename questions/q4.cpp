void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
  Player* player = g_game.getPlayerByName(recipient);

  if (!player) {
    player = new Player(nullptr);
    if (!IOLoginData::loadPlayerByName(player, recipient)) { // if the attempt to load the player's data was unsuccessful, before returning the created player needs to be deleted to prevent memory leak
      delete player;
      return;
    }
  }

  Item* item = Item::CreateItem(itemId);
  if (!item) {
    return;
  }

  g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

  if (player->isOffline()) {
    IOLoginData::savePlayer(player);
  }
}
