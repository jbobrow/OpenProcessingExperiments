
float shipx = 0;
float shipy = 0;
float shipsize = 100;
float torpedox = 0;
float torpedoy = 0;
float torpedosize = 100;
float timer = 10;
float shiptimer = 0;
  
int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 15;
  
PImage ship;
PImage torpedo;
PImage underwater;
PImage losebackground;
PImage winbackground;

  
void setup()
{
  size(900, 695);
  textSize(50);
  frameRate(30);
  ship = requestImage("submarine.png");
  torpedo = requestImage("Torpedo.png");
  underwater = requestImage("286_underwater_lagoon_by_tigers_stock-d41ddbt.jpg");
  losebackground = requestImage("underwater2.jpg");
  winbackground = requestImage("underwater3.jpg");
}
  
void draw()
{
  if (gamestate == PLAY_STATE)
  {
    image(underwater, 0, 0, width, height);
    timer = timer - (1.0 / 30.0);
    shiptimer = shiptimer + (1.0 / 30.0);
      
    if (shiptimer < .75)
    {
      if (shipx < width - shipsize)
      {
        shipx = shipx + (5 * shiptimer);
      }
      if (shipy > 0)
      {
        shipy = shipy - 2;
      }
      if (torpedox < width - torpedosize)
      {
        torpedox = torpedox + (5 * shiptimer);
      }
      if (torpedoy > 0)
      {
        torpedoy = torpedoy - 3.0;
      }
    }
    else
    {
      if (shipx > 0)
      {
        shipx = shipx - 2;
      }
      if (shipy < height - shipsize)
      {
        shipy = shipy + (5 * shiptimer);
      }
      if (torpedox > 0)
      {
        torpedox = torpedox - 2;
      }
      if (torpedoy < height - torpedosize)
      {
        torpedoy = torpedoy + (5 * shiptimer);
      }
    }
      
    
    if (shiptimer > 1.2)
    {
      shiptimer = 0;
      shipx = random(width - shipsize);
      shipy = random(0, height - shipsize);
      torpedox = random(width - torpedosize);
      torpedoy = random(0, height - torpedosize);
    }
      
    if (ship.width > 0)
    {
      image(ship, shipx, shipy, shipsize, shipsize);
    }
    if (torpedo.width > 0)
    {
      image(torpedo, torpedox, torpedoy, torpedosize, torpedosize);
    }
    text("TIME: " + (int)timer, 375, 300);
    text("POINTS: " + clickcount, 325, 400);
    
    if (timer < 0)
    {
      if (clickcount <= 0)
      {
        gamestate = WIN_STATE;
      }
      else
      {
        gamestate = LOSE_STATE;
      }
    }
  }
  if (gamestate == LOSE_STATE)
  {
      image(losebackground, 0, 0, width, height);
      textAlign(CENTER);
      text("YOU LOST SUCKA!", 0, 200, width, 100);
  }
  if (gamestate == WIN_STATE)
  {
      image(winbackground, 0, 0, width, height);
      textAlign(CENTER);
      text("YOU ACTUALLY WON!", 0, 200, width, 100);
  }
}
  
void mouseReleased()
{
  if (clickcount > 0)
  {
    if (mouseX > shipx
      && mouseY > shipy
      && mouseX < (shipx + shipsize)
      && mouseY < (shipy + shipsize))
    {
      clickcount = clickcount - 1;
      shipsize = shipsize * 0.95;
    }
    if (mouseX > torpedox
      && mouseY > torpedoy
      && mouseX < (torpedox + torpedosize)
      && mouseY < (torpedoy + torpedosize))
    {
      clickcount = clickcount + 1;
      torpedosize = torpedosize * 2;
    }
  }
}



