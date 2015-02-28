
public void checkShipToShip()
{
  for (Ship firstShip : shipList)
  {    
    for (Ship secondShip : shipList)
    {      
      if ((dist(firstShip.getX(), firstShip.getY(), secondShip.getX(), secondShip.getY()) < SHIP_SIZE) && !firstShip.getBelongsTo().equals(secondShip.getBelongsTo()))
      {
        explosionList.add(new Explosion(firstShip.getX(), firstShip.getY()));//hereherehere
        
        shipExplosion.rewind();
        shipExplosion.play();
        
        if (firstShip.getNum() > secondShip.getNum())
        {
          firstShip.setNum(firstShip.getNum() - secondShip.getNum());
          secondShip.setX(-100);
          secondShip.setY(-100);
        }

        else if (secondShip.getNum() > firstShip.getNum())
        {
          secondShip.setNum(secondShip.getNum() - firstShip.getNum());
          firstShip.setX(-100);
          firstShip.setY(-100);
        }

        else
        {
          firstShip.setX(-100);
          firstShip.setY(-100);
          secondShip.setX(-100);
          secondShip.setY(-100);
        }
      }
    }
  }
}

public void checkShipToPlanet()
{
  for (int i = 0; i < shipList.size(); i++)
  {    
    Ship shipTemp = shipList.get(i);

    for (int j = 0; j < planetList.size(); j++)
    {      
      Planet planetTemp = planetList.get(j);

      if (planetTemp.equals(shipTemp.getDest()))
      {
        if ((dist(shipTemp.getX(), shipTemp.getY(), planetTemp.getX(), planetTemp.getY()) < (SHIP_SIZE / 2 + planetTemp.getSize() / 2)) && !shipTemp.getBelongsTo().equals(planetTemp.getBelongsTo()))//Ship and planet belong to different users
        {
          if(!planetTemp.getBelongsTo().equals(PLAYERS[0]))
          {
            planetExplosion.rewind();
            planetExplosion.play();
            println("song played");
          }
          
          if(!planetTemp.getBelongsTo().equals(PLAYERS[0]))
          {
            explosionList.add(new Explosion(shipTemp.getX(), shipTemp.getY()));//hereherehere
          }
          
          if (shipTemp.getNum() > planetTemp.getUnits())
          {
            if (!planetTemp.getProtection())
            {
              planetTemp.setUnits(shipTemp.getNum() - planetTemp.getUnits());
              planetTemp.setBelongsTo(shipTemp.getBelongsTo());
            }
            shipTemp.setX(-100);
            shipTemp.setY(-100);
            
            if(planetList.get(counter2).equals(planetTemp))
            {
              player1.setCurrentUnits(planetList.get(counter2).getUnits() - 1);
            }
            
            else if(planetList.get(counter3).equals(planetTemp))
            {
              player2.setCurrentUnits(planetList.get(counter3).getUnits() - 1);
            }
          }

          else if (shipTemp.getNum() < planetTemp.getUnits())
          {
            if (!planetTemp.getProtection())
            {
              planetTemp.setUnits(planetTemp.getUnits() - shipTemp.getNum());
            }
            shipTemp.setX(-100);
            shipTemp.setY(-100);
            
            if(planetList.get(counter2).equals(planetTemp))
            {
              player1.setCurrentUnits(planetList.get(counter2).getUnits() - 1);
            }
            
            else if(planetList.get(counter3).equals(planetTemp))
            {
              player2.setCurrentUnits(planetList.get(counter3).getUnits() - 1);
            }
          }

          else if (shipTemp.getNum() == planetTemp.getUnits())
          {
            if (!planetTemp.getProtection())
            {
              planetTemp.setBelongsTo(PLAYERS[0]);
              planetTemp.setUnits(0);
            }
            shipTemp.setX(-100);
            shipTemp.setY(-100);
            
            if(planetList.get(counter2).equals(planetTemp))
            {
              player1.setCurrentUnits(0);
            }
            
            else if(planetList.get(counter3).equals(planetTemp))
            {
              player2.setCurrentUnits(0);
            }
          }
        }
        //Ship and planet belong to the same people
        else if ((dist(shipTemp.getX(), shipTemp.getY(), planetTemp.getX(), planetTemp.getY()) < (SHIP_SIZE / 2 + planetTemp.getSize() / 2)) && !planetTemp.equals(shipTemp.getHome()) && shipTemp.getBelongsTo().equals(planetTemp.getBelongsTo()))
        {
          planetTemp.setUnits(planetTemp.getUnits() + shipTemp.getNum());
          shipTemp.setX(-100);
          shipTemp.setY(-100);
        }
      }
    }
  }
}

public void checkShipToShield()
{
  for (int i = 0; i < shipList.size(); i++)
  {    
    Ship shipTemp = shipList.get(i);

    for (int j = 0; j < shieldList.size(); j++)
    {      
      Shield shieldTemp = shieldList.get(j);

      if (!shieldTemp.getInUse())
      {
        if(dist(shipTemp.getX(), shipTemp.getY(), shieldTemp.getSpawnX(), shieldTemp.getSpawnY()) < (SHIP_SIZE / 2 + SHIELD_SIZE / 2))
        {
          shieldTemp.setBelongsTo(shipTemp.getBelongsTo());
          shieldTemp.setInUse(true);

          Planet toSet = findWeakest(shipTemp.getBelongsTo());    
          shieldTemp.setProtecting(toSet);
          shieldTemp.setFrameUsed();

          toSet.setProtection(true);
        }
      }
    }
  }
}

