
float timer = 10;
float ghosttimer = 0;
float ghostX = 0;
float ghostY = 0;
float ghost2X = 400;
float ghost2Y = 0;
float ghostsize = 100;
float ghost2size = 100;

float textmove = 0;
float textmoveX = 0;
float textmoveY = 0;

 
int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
float fright = 0;

String w = "CONGRATULATIONS YOU'RE A GHOSTBUSTER!!";
String l = "YOU ARE HAUNTED...";
 
PImage ghost;
PImage ghost2;
PImage winScreen;
PImage loseScreen;
PImage backgroundLvl;
PImage wrong;
 
void setup()
{
  size(500, 500);
  textSize(50);
  frameRate(30);
  ghost = requestImage("ghost.png");
  ghost2 = requestImage("ghost2.jpg");
  winScreen = requestImage("winscreen.jpg");
  loseScreen = requestImage("losescreen.jpg");
  backgroundLvl = requestImage("backgroundghost.jpg");
  wrong = requestImage("bad.jpg");
}
 
void draw()
{
  if (gamestate == PLAY_STATE)
  {
    image(backgroundLvl, 0, 0, width, height);
    timer = timer - (1.0 / 30.0);
    ghosttimer = ghosttimer + (1.0 / 30.0);
     
    if (ghosttimer < .75)
    {
      if (ghostX < width - ghostsize)
      {
        ghostX = ghostX + (5 * ghosttimer);
      }
      if (ghostY > 0)
      {
        ghostY = ghostY - 2;
      }
      
     if (ghost2X < width - ghostsize)
      {
        ghost2X = ghost2X + (5 * ghosttimer);
      }
      if (ghost2Y > 0)
      {
        ghost2Y = ghost2Y - 2;
      }
    }
    else
    {
      if (ghostX > 0)
      {
        ghostX = ghostX - 2;
      }
      if (ghostY < height - ghostsize)
      {
        ghostY = ghostY + (5 * ghosttimer);
      }
      
      if (ghost2X > 0)
      {
        ghost2X = ghostX - 2;
      }
      if (ghost2Y < height - ghostsize)
      {
        ghost2Y = ghost2Y + (5 * ghosttimer);
      }
    }
     
    if (ghosttimer > 1)
    {
      ghosttimer = 0;
      ghostX = random(width - ghostsize);
      ghostY = random(0, height - ghostsize);
      ghost2X = random(width - ghostsize);
      ghost2Y = random(0, height - ghostsize);
    }
   
    if (ghost.width > 0)
    {
      image(ghost, ghostX, ghostY, ghostsize, ghostsize);
    }
    
    if (ghost2.width > 0)
    {
      image(ghost2, ghost2X, ghost2Y, ghost2size, ghost2size);
    }
     
    fill(255);
    text("TIME: " + (int)timer, 0, 450);
    text("FRIGHT: " + (int)fright, 200, 450);

   
    if (timer < 0)
    {
      if (fright <= 1)
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
      image(loseScreen, 0, 0, width, height);
      textAlign(LEFT, TOP);
      fill(255, 0, 0);
      float nextY = textmoveY + 5;
      text(l, textmoveX, textmoveY, width, 100);
      textmoveY = nextY;
      if (textmoveY >= height - 50)
      {
        textmoveY = 0;
      }
  }
  if (gamestate == WIN_STATE)
  {
      image(winScreen, 0, 0, width, height);
      textAlign(LEFT);
      float nextY = textmoveY + 1;
      text(w, textmoveX, textmoveY, width, height);
      textmoveY = nextY;
      if (textmoveY >= height - 50)
      {
        textmoveY = 0;
      }
  }
}
 
void mouseReleased()
{
  if (ghostsize > 0)
  {
    if (mouseX > ghostX
      && mouseY > ghostY
      && mouseX < (ghostX + ghostsize)
      && mouseY < (ghostY + ghostsize))
    {
      ghostsize = ghostsize - 10;
      fright = fright - 1;
    }
  }
    
    if (ghost2size > 0)
  {
    if (mouseX > ghost2X
      && mouseY > ghost2Y
      && mouseX < (ghost2X + ghost2size)
      && mouseY < (ghost2Y + ghost2size))
    {
      ghost2size = ghost2size + 10;
      fright = fright + 1;
      image(wrong, 0, 0, width, height);
    }
  }
}



