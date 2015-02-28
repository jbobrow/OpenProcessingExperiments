
/*
Dillon Marlatt 10/15/13
This is an example of flip-screen overhead
game movement mechanics.
*/

int playerXPos;
int playerYPos;
String screen;

void setup()
{
  size(300, 300);
  noStroke();
  playerXPos = 140;
  playerYPos = 140;
  screen = "Origin";
}

void draw()
{
  background(0);
  
  //map grid
  fill(50);
  rect(135, 95, 30, 30); //North
  rect(95, 135, 30, 30); //West
  rect(135, 135, 30, 30); //Origin
  rect(175, 135, 30, 30); //East
  rect(135, 175, 30, 30); //South
  fill(150);
  if(screen == "Origin")
    rect(135, 135, 30, 30);
  else if(screen == "West")
    rect(95, 135, 30, 30);
  else if(screen == "North")
    rect(135, 95, 30, 30);
  else if(screen == "East")
    rect(175, 135, 30, 30);
  else if(screen == "South")
    rect(135, 175, 30, 30);
  
  //player
  fill(255);
  rect(playerXPos, playerYPos, 20, 20);
  
  checkBoundry();
}

void keyPressed()
{
  if(key == 'W' || key == 'w')
    playerYPos-=5;
  if(key == 'A' || key == 'a')
    playerXPos-=5;
  if(key == 'S' || key == 's')
    playerYPos+=5;
  if(key == 'D' || key == 'd')
    playerXPos+=5;
}

void checkBoundry()
{
  if(screen == "Origin")
  {
    if(playerXPos < 10)
    {
      screen = "West";
      playerXPos = 290;
    }
    else if(playerXPos > 290)
    {
      screen = "East";
      playerXPos = 10;
    }
    else if(playerYPos < 10)
    {
      screen = "North";
      playerYPos = 290;
    }
    else if(playerYPos > 290)
    {
      screen = "South";
      playerYPos = 10;
    }
  }
  else if(screen == "West")
  {
    if(playerXPos > 290)
    {
      screen = "Origin";
      playerXPos = 10;
    }
  }
  else if(screen == "North")
  {
    if(playerYPos > 290)
    {
      screen = "Origin";
      playerYPos = 10;
    }
  }
  else if(screen == "East")
  {
    if(playerXPos < 10)
    {
      screen = "Origin";
      playerXPos = 290;
    }
  }
  else if(screen == "South")
  {
    if(playerYPos < 10)
    {
      screen = "Origin";
      playerYPos = 290;
    }
  }
}


