
float timer = 10;
float dragontimer = 0;
float dragonx = 0;
float dragony = 0;
float dragonsize = 100;

float dragontimer2 = 0;
float dragonx2 = 0;
float dragony2 = 0;
float dragonsize2 = 100;

float dragontimer3 = 0;
float dragonx3 = 0;
float dragony3 = 0;
float dragonsize3 = 100;

float dragontimer4 = 0;
float dragonx4 = 0;
float dragony4 = 0;
float dragonsize4 = 100;



int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 10;

PImage dragon;
PImage hell;
PImage dragon2;
PImage dragon3;
PImage loser;
PImage winner;

void setup()
{
  size (500, 500);
  textSize(50);
  frameRate(30);
  dragon = requestImage ("dragon.png");
  hell = requestImage ("hell.jpg");
  dragon2 = requestImage ("dragon2.png");
  dragon3 = requestImage ("dragon3.png");
  loser = requestImage ("loser.jpg");
  winner = requestImage ("winner.jpg");
}

 
void draw()
{
  if (gamestate == PLAY_STATE)
  {
    image(hell, 0, 0, width, height);
    timer = timer - (1.0 / 30.0);
    dragontimer = dragontimer + (1.0 / 30.0);
     
    if (dragontimer < .75)
    {
      if (dragonx < width - dragonsize)
      {
        dragonx = dragonx + (5 * dragontimer);
      }
      if (dragony > 0)
      {
        dragony = dragony - 2;
      }
    }
    else
    {
      if (dragonx > 0)
      {
        dragonx = dragonx - 2;
      }
      if (dragony < height - dragonsize)
      {
        dragony = dragony + (5 * dragontimer);
      }
    }
     
    // randomly change square position every 1.5 seconds
    if (dragontimer > 1.5)
    {
      dragontimer = 0;
      dragonx = random(width - dragonsize);
      dragony = random(0, height - dragonsize);
    }
     
    //fill(random(255), random(255), random(255));
    //rect(squarex, squarey, squaresize, squaresize);
    if (dragon.width > 0)
    {
      image(dragon, dragonx, dragony, dragonsize, dragonsize);
    }
     
    fill(0);
    text("TIME: " + (int)timer, 200, 200);
    text("AMMO: " + clickcount, 100, 100);
   
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
      image(loser, 0, 0, width, height);
      stroke (#551A8B);
      textAlign(CENTER);
      text("MISSION FAILED", 0, 0, width, 100);
  }
  if (gamestate == WIN_STATE)
  {
      image(winner, 0, 0, height, width);
      stroke (#551A8B);
      textAlign(CENTER);
      text("NICE SHOT", 0, 0, width, 100);
  }
   if (dragontimer2 < 1.3)
    {
      dragontimer2 = 0;
      dragonx2 = random(width - dragonsize2);
      dragony2 = random(0, height - dragonsize2);
    }

    //fill(random(255), random(255), random(255));
    //rect(dragonx2, dragony2, dragonsize2, dragonsize2);
    if (dragon2.width > 0)
    {
      image(dragon2, dragonx * .5, dragony, dragonsize2, dragonsize2);
    }
     if (dragontimer3 < 1.5)
    {
      dragontimer3 = 0;
      dragonx3 = random(width - dragonsize3);
      dragony3 = random(0, height - dragonsize3);
    }
     
    if (dragon3.width > 0)
    {
      image(dragon3, dragonx + 100, dragony, dragonsize3, dragonsize3);
    }

  }


 
void mouseReleased()
{
  if (clickcount > 0)
  {
    if (mouseX > dragonx
      && mouseY > dragony
      && mouseX < (dragonx + dragonsize)
      && mouseY < (dragony + dragonsize))
    {
      clickcount = clickcount - 1;
      dragonsize = dragonsize * 0.95;
    }
  }
}



