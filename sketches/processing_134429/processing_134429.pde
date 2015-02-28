
/* @pjs preload="AngryBird.png"; */

float timer = 10;
float birdtimer = 0;
float birdx = 0;
float birdy = 0;
float birdsize = 100;
float birdcounter = 12;

int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 12;
 
PImage galaxy;
PImage bird;
 
void setup()
{
  size(750, 500);
  textSize(50);
  frameRate(30);
  galaxy = requestImage("Galaxy.png");
  bird = loadImage("AngryBird.png");
}
 
void draw()
{
  if (gamestate == PLAY_STATE)
  {
    image(galaxy, 0, 0, width, height);
    timer = timer - (1.0 / 30.0);
    birdtimer = birdtimer + (1.0 / 30.0);
     
    if (birdtimer < .75)
    {
      if (birdx < width - birdsize)
      {
        birdx = birdx + (5 * birdtimer);
      }
      if (birdy > 0)
      {
        birdy = birdy - 2;
      }
    }
    else
    {
      if (birdx > 0)
      {
        birdx = birdx - 2;
      }
      if (birdy < height - birdsize)
      {
        birdy = birdy + (5 * birdtimer);
      }
    }
     
    // randomly change square position every 2 seconds
    if (birdtimer > 2)
    {
      birdtimer = 0;
      birdx = random(width - birdsize);
      birdy = random(0, height - birdsize);
    }
    
    if (birdcounter <= 0)
    {
      birdtimer = 0;
      birdx = 2000;
      birdy = 1500;
    }
     
    //fill(random(255), random(255), random(255));
    //rect(squarex, squarey, squaresize, squaresize);
    if (bird.width > 0)
    {
      image(bird, birdx, birdy, birdsize, birdsize);
    }
     
    fill(255);
    text("TIME: " + (int)timer, 0, 50);
    text("BULLETS: " + clickcount, 0, 100);
   
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
      background(255, 0, 0);
      textAlign(CENTER);
      text("YOUR SOUL IS OURS!!!", 0, 0, width, 100);
  }
  if (gamestate == WIN_STATE)
  {
      background(0, 255, 0);
      textAlign(CENTER);
      text("YOUR PLANET IS SAFE!!!", 0, 0, width, 100);
  }
}
 
void mouseReleased()
{
  if (clickcount > 0)
  {
    if (mouseX > birdx
      && mouseY > birdy
      && mouseX < (birdx + birdsize)
      && mouseY < (birdy + birdsize))
    {
      clickcount = clickcount - 1;
      birdcounter = birdcounter - 1;
    }

  }
}



