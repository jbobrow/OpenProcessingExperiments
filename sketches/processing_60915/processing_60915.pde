
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/50492*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/*
Riley Galloway - Space Invaders
 Click to shoot, and shoot in the center of the aliens and space ships.
 If the alien or space ship reaches your cannon lazer thing, you lose!
 
 Updated:5/8/12
 */

PImage back, gun1, gun2, gun3, alien, ship;
PFont lucida, wl;
int wave;
int gunshot;
int score = 0;
int kills;
int alienpos;
int shippos;
int xalienpos;
int xshippos;
int lose;
int randomm = 0;
int randommm;
int poss;
int life = 3;
int mouseClicks = 0;
boolean gaming = false;

void setup()
{
  smooth();
  frameRate(50);
  wave = 1;
  poss = 0;
  alienpos = 0;
  shippos = 0;
  noCursor();
  background(0);
  size(891, 494);
  strokeWeight(3);
  back = loadImage("back.png");
  gun1 = loadImage("gun1.png");
  gun2 = loadImage("gun2.png");
  gun3 = loadImage("gun3.png");
  alien = loadImage("alien.png");
  ship = loadImage("ship.png");
  lucida = loadFont("LucidaConsole-15.vlw");
  wl = loadFont("LucidaConsole-40.vlw");
  fill(0, 255, 0);
  textFont(lucida, 15);
  textFont(wl, 40);
  fill(0, 255, 255);
}

void draw()
{
  if (gaming)
  {
    image(back, 0, 0);
    textFont(lucida, 15);
    text("Score: " + score, 0, 11);
    text("Wave: " + wave, 0, 26);
    text("Lives: " + life, 0, 41);
    stroke(255);
    strokeWeight(1);
    fill(0, 0, 0, 0);
    ellipse(mouseX + 18, mouseY, 30, 30);
    line(mouseX + 18 - 7, mouseY, mouseX + 18 + 7, mouseY);
    line(mouseX + 18, mouseY - 7, mouseX + 18, mouseY + 7);
    strokeWeight(3);
    fill(0, 255, 255);
    if (wave == 1)
    {
      frameRate(50);
      if ((kills >= 10) && (kills < 30))
      {
        wave = 2;
      }
      if (lose == 1)
      {
        dolose();
        wave = 4;
      }
      stroke(0, 255, 0);
      image(gun1, mouseX, 360);
      gunshot = 160;
      alien();
    }
    if (wave == 2)
    {
      frameRate(75);
      if ((kills >= 30) && (kills < 40))
      {
        wave = 3;
      }
      if (lose == 1)
      {
        dolose();
        wave = 4;
      }
      stroke(255, 0, 0);
      image(gun2, mouseX, 360);
      gunshot = 200;
      ship();
    }
    if (wave == 3)
    {
      frameRate(100);
      if (kills >= 60)
      {
        win();
        wave = 5;
      }
      if (lose == 1)
      {
        dolose();
        wave = 4;
      }
      stroke(0, 0, 255);
      image(gun3, mouseX, 360);
      gunshot = 250;
      alien();
      ship();
    }
    if (wave == 4)
    {
      dolose();
      gunshot = 0;
      stroke(0);
      poss = 1;
      life = 0;
    }
    if (wave == 5)
    {
      win();
      stroke(0);
      gunshot = 0;
      poss = 1;
    }
  }
  else if (!gaming)
  {
    image(back, 0, 0);
    textFont(wl, 60);
    text("Press any key to start...", 0, 200);
    textFont(lucida,15);
    text("Instructions/Overview:\nShoot the aliens and spaceships and don't let them them get to your laser!\nYou get 3 lives and you must pass 3 waves. Each wave will go by faster and\nwill get harder each time...",100,15);
    text("Presented by Riley Galloway",300,400);
    if (keyPressed)
    {
      gaming = true;
    }
  }
}

void dolose()
{
  textFont(wl, 90);
  text("You Lose!", 200, 200);
  textFont(lucida, 15);
  text("Your ratio of clicks to kills is " + mouseClicks + ":" + kills + "...", 255, 400);
}

void win()
{
  textFont(wl, 90);
  text("You Win!", 230, 200);
  textFont(lucida, 15);
  text("Your ratio of clicks to kills is " + mouseClicks + ":" + kills + "...", 255, 400);
}

void alien()
{
  if (randomm == 0)
  {
    randommn();
  }
  if (alienpos + 203 > 360)
  {
    life--;
    if (life <= 0)
    {
      lose = 1;
    }
    else if (life > 0)
    {
      randommn();
      alienpos = 0;
    }
  }
  alienpos++;
  image(alien, xalienpos, alienpos);
}

void ship()
{
  if (randommm == 0)
  {
    randommmn();
  }
  if (shippos + 143 > 360)//to mark where the losing point is
  {
    life--;
    if (life <= 0)
    {
      lose = 1;
    }
    else if (life > 0)
    {
      randommmn();
      alienpos = 0;
    }
  }
  shippos++;
  image(ship, xshippos, shippos);
}

void randommn()
{
  xalienpos = int(random(10, 746));
  randomm++;
}

void randommmn()
{
  xshippos = int(random(10, 658));
  randommm++;
}

void mouseReleased()
{
  if (gaming)
  {
    mouseClicks++;
    if (poss == 0)
    {
      line(mouseX + 18, 360, mouseX + 18, 360 - gunshot);
      if ((mouseX + 18 >= xalienpos) && (mouseX + 18 <= xalienpos + 145))//to center the beam and mark where the kill point is
      {
        score = score + 50;
        kills++;
        randomm = 0;
        alienpos = 0;
      }
      if ((mouseX + 18 >= xshippos) && (mouseX + 18 <= xshippos + 233))
      {
        randommm = 0;
        kills++;
        score = score + 100;
        shippos = 0;
      }
    }
  }
}


