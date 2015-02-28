
class ghost
{
  PImage rightWalking;
  PImage leftWalking;

  boolean scared;
  boolean test;

  int i;
  int currentPositionX;
  int newPositionX;
  int currentPositionY;
  int newPositionY;

  int tempPlayerX;
  int tempPlayerY;

  ghost(int tI)
  {
    rightWalking = loadImage ("GhostRight.png");
    leftWalking = loadImage ("GhostLeft.png");

    scared = false;

    i = tI; 
    if (i< 20)
    {
      currentPositionX = 0 + 10*i;
    }
    if (i>19)
    {
      currentPositionX =860 - 10*(i-20);
    }

    if (i<20)
    {
      currentPositionY = i * 20;
    }

    if (i > 19)
    {
      currentPositionY = (i - 20)*20;
    }


    newPositionX = currentPositionX;
    newPositionY = currentPositionY;

    tempPlayerX = 0;
    tempPlayerY = 0;
  }

  void display(int tempPosX, int tempPosY, int tempNessX, int tempNessY, boolean checkScared)
  {

    scared = checkScared;
    newPositionX = tempPosX;
    newPositionY = tempPosY;
    tempPlayerX = tempNessX;
    tempPlayerY = tempNessY;

    if (newPositionX < tempPlayerX)
    {
      image(rightWalking, newPositionX, newPositionY, 20, 20);
    }
    if (newPositionX > tempPlayerX)
    {
      image(leftWalking, newPositionX, newPositionY, 20, 20);
    }
    if (newPositionX == tempPlayerX)
    {
      image(rightWalking, newPositionX, newPositionY, 20, 20);
    }
  }

  int updatePositionX(int playerPositionX, int enemyPositionX)
  {

    currentPositionX = enemyPositionX;
    tempPlayerX = playerPositionX;
    newPositionX = currentPositionX;

    if (scared = true)
    {
      if (tempPlayerX!= currentPositionX)
      {
        if (tempPlayerX < currentPositionX)
        {
          newPositionX = currentPositionX + 1;
        }
        if (tempPlayerX > currentPositionX)
        {
          newPositionX = currentPositionX - 1;
        }
      }
    }

    if (tempPlayerX != currentPositionX)
    {
      if (tempPlayerX < currentPositionX)
      {
        newPositionX = currentPositionX - 1;
      }
      if (tempPlayerX > currentPositionX)
      {
        newPositionX = currentPositionX + 1;
      }
    } 
    return newPositionX;
  }


  int updatePositionY(int playerPositionY, int enemyPositionY)
  {
    currentPositionY = enemyPositionY;
    tempPlayerY = playerPositionY;
    newPositionY = currentPositionY;

    if (scared = true)
    {
      if (tempPlayerY != currentPositionY)
      {
        if (tempPlayerY < currentPositionY)
        {
          newPositionY = currentPositionY + 1;
        }
        if (tempPlayerY > currentPositionY)
        {
          newPositionY = currentPositionY - 1;
        }
      }
    }

    if (scared != true)
    {
      if (tempPlayerY != currentPositionY)
      {
        if (tempPlayerY < currentPositionY)
        {
          newPositionY = currentPositionY - 1;
        }
        if (tempPlayerY > currentPositionY)
        {
          newPositionY = currentPositionY + 1;
        }
      }
    }
    return newPositionY;
  }

  void beTerrified()
  {
    scared = true;
  }

  boolean checkScared()
  {
    return scared;
  }

  int getX()
  {
    return currentPositionX;
  }

  int getY()
  {
    return currentPositionY;
  }
}


