
class ness
{ 
  PImage[] leftWalking = new PImage[10];
  PImage[] rightWalking = new PImage[10];

  int walkingCounter;
  int newPositionX;
  int oldPositionX;

  int newPositionY;
  int oldPositionY;
  int tracker;
  ness(int tempX, int tempY)
  {
    int walkingCounter = 0;
    int newPositionX = 0;
    int oldPositionX = 0;
    int newPositionY = 0;
    int oldPositionY = 0;

    leftWalking[0] = loadImage ( "NessLeft1.png");
    leftWalking[1] = loadImage ( "NessLeft1.png");
    leftWalking[2] = loadImage ( "NessLeft1.png");
    leftWalking[3] = loadImage ( "NessLeft1.png");
    leftWalking[4] = loadImage ( "NessLeft1.png");
    leftWalking[5] = loadImage ( "NessLeft2.png");
    leftWalking[6] = loadImage ( "NessLeft2.png");
    leftWalking[7] = loadImage ( "NessLeft2.png");
    leftWalking[8] = loadImage ( "NessLeft2.png");
    leftWalking[9] = loadImage ( "NessLeft2.png");

    rightWalking[0] = loadImage ( "NessRight1.png");
    rightWalking[1] = loadImage ( "NessRight1.png");
    rightWalking[2] = loadImage ( "NessRight1.png");
    rightWalking[3] = loadImage ( "NessRight1.png");
    rightWalking[4] = loadImage ( "NessRight1.png");
    rightWalking[5] = loadImage ( "NessRight2.png");
    rightWalking[6] = loadImage ( "NessRight2.png");
    rightWalking[7] = loadImage ( "NessRight2.png");
    rightWalking[8] = loadImage ( "NessRight2.png");
    rightWalking[9] = loadImage ( "NessRight2.png");

    oldPositionX = tempX;
    oldPositionY = tempY;
  }

  void display(int tempX, int tempY, int tempTracker)
  {
    newPositionX = tempX;
    newPositionY = tempY;
    tracker = tempTracker;

    if (tracker == 1)
    {
      image (leftWalking[walkingCounter%10], newPositionX, newPositionY);
    }

    if (tracker == 2)
    {
      image (rightWalking[walkingCounter%10], newPositionX, newPositionY);
    }
    walkingCounter++;
  }

  int updatePositionLeft(int tempX)
  {
    oldPositionX = tempX;
    newPositionX = oldPositionX - 5;
    
    if (newPositionX < 0)
    {
      newPositionX = 0;
    }
    return newPositionX;
  }

  int updatePositionRight(int tempX)
  {
    oldPositionX = tempX;
    newPositionX = oldPositionX + 5;

    if (newPositionX > 870)
    {
      newPositionX = 870;
    }
    return newPositionX;
  }

  int updatePositionUp(int tempY)
  {
    oldPositionY = tempY;
    newPositionY = oldPositionY - 5;

    if (newPositionY < 0)
    {
      newPositionY = 0;
    }
    return newPositionY;
  }

  int updatePositionDown(int tempY)
  {

    oldPositionY = tempY;
    newPositionY = oldPositionY + 5;

    if (newPositionY > 246)
    {
      newPositionY = 246;
    }
    return newPositionY;
  }

  int getX()
  {
    return newPositionX;
  }

  int getY()
  {
    return newPositionY;
  }
}


