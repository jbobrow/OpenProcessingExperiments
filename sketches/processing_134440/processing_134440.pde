
/* @pjs preload="dragon2.jpg, dragon3.jpg, dragon4.jpg, dragon5.jpg, dragon7.jpg, dragonEgg.png"; */
float timer = 10;
float eggtimer = 0;
float eggx = 0;
float eggy = 0;
float eggsize = 100;

int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 20;
int backgroundIndex = 0;

PImage [] myimages = new PImage[5];
PImage egg;

void setup()
{
  size(500, 500);
  textSize(25);
  frameRate(30);
  
  myimages[0] = loadImage ("dragon2.jpg");
  myimages[1] = loadImage ("dragon3.jpg");
  myimages[2] = loadImage ("dragon4.jpg");
  myimages[3] = loadImage ("dragon5.jpg");
  myimages[4] = loadImage ("dragon7.jpg");
  
  egg = loadImage("dragonEgg.png");
}

void draw()
{
  if (gamestate == PLAY_STATE)
  {
    background(255);
    timer = timer - 1.0 / 30.0;
    eggtimer = eggtimer + (1.0 / 30.0);
 
    if (timer >= 1 && timer < 10);
    {
    backgroundIndex = backgroundIndex + 1;
     }
    if (backgroundIndex >= myimages.length)
    {
      backgroundIndex = 0;
    }
      image(myimages[backgroundIndex], 0, 0);
    }

  if (eggtimer < .75)
  {
    if (eggx < width - eggsize)
    {
      eggx = eggx + (5 * eggtimer);
    }
    if (eggy > 0)
    {
      eggy = eggy - 2;
    }
  }
  else
  {
    if (eggx > 0)
    {
      eggx = eggx - 2;
    }
    if (eggy < height - eggsize)
    {
      eggy = eggy + (5 * eggtimer);
    }
  }
  
  if (eggtimer > 1.5)
  {
    eggtimer = 0;
    eggx = random(width - eggsize);
    eggy = random(0, height - eggsize);
  }
  
  if (egg.width > 0)
  {
    image(egg, eggx, eggy, eggsize, eggsize);
  }
  
  fill(255);
  text("TIME: " + (int)timer, 50, 50);
  text("CLICKS: " + clickcount, 50, 75);
  
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
if (gamestate == LOSE_STATE)
{
  background(255, 0, 0);
  textAlign(CENTER);
  text("YOU HAVE BEEN EATEN! AND TASTE GREAT WITH KETCHUP!!", 0, 100, width, 100);
}
if (gamestate == WIN_STATE)
{
  background(0, 255, 0);
  textAlign(CENTER);
  text("YOU HAVE COMPLETED YOUR QUEST! CONGRATS!", 0, 100, width, 100);
}
}

void mouseReleased()
{
  if (clickcount > 0)
  {
    if (mouseX > eggx
      && mouseY > eggy
      && mouseX < (eggx + eggsize)
      && mouseY < (eggy + eggsize))
      {
        clickcount = clickcount - 1;
        eggsize = eggsize * .95;
      }
  }
}





