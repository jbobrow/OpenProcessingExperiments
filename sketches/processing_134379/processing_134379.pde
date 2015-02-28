
float timer = 10;
float boytimer = 0;
float boyx = 0;
float boyy = 0;
float boysize = 100;
float ghostx = 0;
float ghosty = 0;
float ghostsize = 100;
 
int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 15;
 
PImage boy;
PImage forest;
PImage darkforest;
PImage brightforest;
PImage ghost;
 
void setup()
{
  size(500, 500);
  textSize(50);
  frameRate(30);
  boy = requestImage("boy.png");
  ghost = requestImage("Cartoon_monsters_2.png");
  forest = requestImage("Dark-Background-Wallpaper-640x360.jpg");
  darkforest = requestImage("night-forest.jpg");
  brightforest = requestImage("cabin.jpg");
}
 
void draw()
{
  if (gamestate == PLAY_STATE)
  {
    image(forest, 0, 0, width, height);
    timer = timer - (1.0 / 30.0);
    boytimer = boytimer + (1.0 / 30.0);
     
    if (boytimer < .75)
    {
      if (boyx < width - boysize)
      {
        boyx = boyx + (5 * boytimer);
      }
      if (boyy > 0)
      {
        boyy = boyy - 2;
      }
      if (ghostx < width - ghostsize)
      {
        ghostx = ghostx + (5 * boytimer);
      }
      if (ghosty > 0)
      {
        ghosty = ghosty - 3.0;
      }
    }
    else
    {
      if (boyx > 0)
      {
        boyx = boyx - 2;
      }
      if (boyy < height - boysize)
      {
        boyy = boyy + (5 * boytimer);
      }
      if (ghostx > 0)
      {
        ghostx = ghostx - 2;
      }
      if (ghosty < height - ghostsize)
      {
        ghosty = ghosty + (5 * boytimer);
      }
    }
     
    // randomly change boy position every 1.5 seconds
    if (boytimer > 1.5)
    {
      boytimer = 0;
      boyx = random(width - boysize);
      boyy = random(0, height - boysize);
      ghostx = random(width - ghostsize);
      ghosty = random(0, height - ghostsize);
    }
     
    if (boy.width > 0)
    {
      image(boy, boyx, boyy, boysize, boysize);
    }
    if (ghost.width > 0)
    {
      image(ghost, ghostx, ghosty, ghostsize, ghostsize);
    } 
    text("TIME: " + (int)timer, 300, 300);
    text("POINTS: " + clickcount, 200, 400);
   
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
      image(darkforest, 0, 0, width, height);
      textAlign(CENTER);
      text("YOU LOST!!", 0, 0, width, 100);
  }
  if (gamestate == WIN_STATE)
  {
      image(brightforest, 0, 0, width, height);
      textAlign(CENTER);
      text("YOU WON!!", 0, 200, width, 100);
  }
}
 
void mouseReleased()
{
  if (clickcount > 0)
  {
    if (mouseX > boyx
      && mouseY > boyy
      && mouseX < (boyx + boysize)
      && mouseY < (boyy + boysize))
    {
      clickcount = clickcount - 1;
      boysize = boysize * 0.95;
    }
    if (mouseX > ghostx
      && mouseY > ghosty
      && mouseX < (ghostx + ghostsize)
      && mouseY < (ghosty + ghostsize))
    {
      clickcount = clickcount + 1;
      ghostsize = ghostsize * 1.05;
    }
  }
}


