

Box[][] boxes = new Box[20][15];

int bombs = 0;
int flags = 0;
int time = 0;
int timeCounter = 0;

boolean isLost = false;
boolean isWon = false;
void setup()
{
  size(1048, 800);
  for (int y =0; y < 15; y++)
  {
    for (int x = 0; x < 20; x++)
    {

      Box b = new Box(new PVector(x *50, y *50), x, y, false);
      boxes[x][y] = b;
      float i = 0;
      i = random(0, 9);
      if (i < 1 ) 
      {
        bombs++;
        b.hasBomb = true;
      }
    }
  }



  checkSurrounding();
}


void draw()
{
  background(0);

  if (isLost)
  {
    lostState();
  }
  else if (!isLost && !isWon)
  {
    timeCounter++;
    if (timeCounter >= 60) 
    {
      time++;
      timeCounter = 0;
    }


    for (int y =0; y < 15; y++)
    {
      for (int x = 0; x < 20; x++)
      {
        boxes[x][y].update();
        if (mouseX > boxes[x][y].position.x && mouseX < boxes[x][y].position.x + 50 && 
          mouseY > boxes[x][y].position.y && mouseY < boxes[x][y].position.y + 50) boxes[x][y].highlighted = true;
        else boxes[x][y].highlighted = false;

        if (boxes[x][y].touched == 0 && boxes[x][y].hidden == false)
        {
          revealSurrounding(x, y);
        }
      }
    }
    fill(255);
    text("bombs to find: "  + (bombs - flags), 0, 799);
    text("Time: " + time, 512, 799);
  }

  if (bombs - flags == 0) checkForWin();
}

void checkForWin()
{
  int i = 0;
  for (int y =0; y < 15; y++)
  {
    for (int x = 0; x < 20; x++)
    {
      if (boxes[x][y].hasBomb && boxes[x][y].hasFlag) i++;
      
    }
  }
  if (i == bombs) isWon = true;
}
void lostState()
{
  for (int y =0; y < 15; y++)
  {
    for (int x = 0; x < 20; x++)
    {
      boxes[x][y].hidden = false;
      boxes[x][y].update();
    }
  }
  text("You Lose", 0, 800);
  text("Time: " + time, 512, 799);
}

void winState()
{
  for (int y =0; y < 15; y++)
  {
    for (int x = 0; x < 20; x++)
    {
      boxes[x][y].hidden = false;
      boxes[x][y].update();
    }
  }
  text("You Win!!", 0, 800);
  text("Time: " + time, 512, 799);
}


void checkSurrounding()
{
  for (int y =0; y < 15; y++)
  {
    for (int x = 0; x < 20; x++)
    {
      if ( boxes[x][y].hasBomb)
      {
        if (x != 0)
        {
          if (y != 14) boxes[x - 1][y + 1].touched += 1;
          if (y != 0) boxes[x - 1][y - 1].touched += 1;
          boxes[x - 1][y].touched += 1;
        }
        if (x != 19)
        {
          boxes[x + 1][y].touched += 1;
          if (y != 14) boxes[x + 1][y + 1].touched += 1;
          if (y != 0) boxes[x + 1][y - 1].touched += 1;
        }
        if (y != 0) boxes[x][y - 1].touched += 1;
        if (y != 14) boxes[x][y + 1].touched += 1;
      }
      //end if hasBomb
    }
    //end X loop
  }
  //end Y loop
}

void revealSurrounding(int x, int y)
{
  if (x != 0)
  {
    if (y != 14) boxes[x - 1][y + 1].hidden = false;
    if (y != 0) boxes[x - 1][y - 1].hidden = false;
    boxes[x - 1][y].hidden = false;
  }
  if (x != 19)
  {
    boxes[x + 1][y].hidden = false;
    if (y != 14) boxes[x + 1][y + 1].hidden = false;
    if (y != 0) boxes[x + 1][y - 1].hidden = false;
  }
  if (y != 0) boxes[x][y - 1].hidden = false;
  if (y != 14) boxes[x][y + 1].hidden = false;
}

void mousePressed()
{
  if (!isLost && !isWon)
  {
    for (int y =0; y < 15; y++)
    {
      for (int x = 0; x < 20; x++)
      {
        if (boxes[x][y].highlighted)
        {
          if (mouseButton == LEFT)
          {
            if ( boxes[x][y].hasBomb) isLost = true;
            if (boxes[x][y].touched == 0) revealSurrounding(x, y);

            boxes[x][y].hidden = false;
          }
          if (mouseButton == RIGHT)
          {
            boxes[x][y].hasFlag = !boxes[x][y].hasFlag;
            flags++;
          }
        }
      }
    }
  }
}

class Box
{
  PVector position;
  int X = 0;
  int Y = 0;
  boolean hidden = true;
  boolean hasBomb = false;
  boolean hasFlag = false;
  boolean highlighted = false;
  int touched = 0;

  Box(PVector position, int X, int Y, boolean hasBomb)
  {
    this.position = position;
    this.X = X;
    this.Y = Y;
    this.hasBomb = hasBomb;
  }


  void update()
  {
    colorMode(HSB);
    if (hidden) fill(0, 0, 150);
    if (highlighted) fill(0, 0, 255);
    else fill(0, 0, 215);
    rect(position.x, position.y, 50, 50);
    if (hasBomb && !hidden)
    {
      fill(0);
      ellipse(position.x + 25, position.y + 25, 25, 25);
    }
    stroke(0);
    fill(0);
    textSize(32);
    //text(X + "," + Y, position.x, position.y + 50);
    if (!hidden && !hasBomb)
    {
      fill(30*touched, 255, 255);
      stroke(0);
      text(touched, position.x + 20, position.y +40);
    }
    if (hasFlag)
    {
      fill(0,255,255);
      rect(position.x + 10, position.y + 10, 40, 40);
       
    }


    if (touched > 0 && !hasBomb)
    {
    }
  }
}



