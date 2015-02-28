
/* @pjs font="EvilFont.vlw"; preload = "Face_Blast.png, Face_Charged.png, Face_Charging.png, Face_MegaBlast.png, Face_Neutral.png"; */

class MadAlien
{
 PImage image;
}

MadAlien xenocide;
int evil = 0;
int colour;
int protection;
PImage neutral;
PImage charging;
PImage charged;
PImage blast;
PImage megablast;
PFont font;

void setup()
{
  size(800, 800);
  background(255);
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100, 100);
  
  neutral = loadImage("Face_Neutral.png");
  charging = loadImage("Face_Charging.png");
  charged = loadImage("Face_Charged.png");
  blast = loadImage("Face_Blast.png");
  megablast = loadImage("Face_MegaBlast.png");
  font = loadFont("EvilFont.vlw");
  textFont(font, 90);
  textMode(CENTER);
  
  xenocide = new MadAlien();
  xenocide.image = neutral;
}

void draw()
{
  background(0, 0, 100);
  colour = int(random(0, 360));
  fill(0, 0, 0);
  text("Evil:", 50, 130);
  text(evil, 600, 130);
  
  if(evil < 50)
  {
    xenocide.image = neutral;
  }
  else if(evil > 50 && evil < 100)
  {
    xenocide.image = charging;
  }
  else if(evil >= 100)
  {
    xenocide.image = charged;
  }
  
  if(mousePressed)
  {
    laserBlaster(colour, evil);
    xenoFace(evil);
    if (evil > 0)
    {
    evil--;
    }
  }
  laserBarrier(colour, evil);
  
  image(xenocide.image, width/2, 120);
}

void mouseReleased()
{
  xenocide.image = loadImage("Face_Neutral.png");
}

void keyReleased()
{
  if (key == 'w')
  {
    evil += 5;
  }
  else if (key == 'a')
  {
    protection = 1;
  }
  else if (key == 's')
  {
    protection = 2;
  }
  else if (key == 'd')
  {
    protection = 3;
  }
}

void xenoFace(int evilx)
{
    if (evil < 100)
    {
      xenocide.image = blast;
    }
    else if (evil >= 100)
    {
      xenocide.image = megablast;
    }
}

void laserBarrier(int colourx, int evilx)
{
  for(int i = 0; i < 50; i++)
  {
    noStroke();
    rectMode(CENTER);
    fill(colourx, random(50, 100), random(50, 100));
    if (protection == 1)
    {
      rect(random(20, 250), 250, random(30, 60), random(30, 60));
    }
    else if (protection == 2)
    {
      rect(random(260, 550), 250, random(30, 60), random(30, 60));
    }
    else if (protection == 3)
    {
      rect(random(560, 770), 250, random(30, 60), random(30, 60));
    }
  }
}

void laserBlaster(int colourx, int evilx)
{
    if (evilx == 0)
    {
      for(int i = 0; i < 40; i++)
      {
        noStroke();
        ellipseMode(CENTER);
        fill(colourx, random(50, 100), random(50, 100));
        ellipse(random(mouseX - 50, mouseX + 50), random(mouseY - 50, mouseY + 50), random(30, 60), random(30, 60));
      }
    }
    if (evilx >= 1 && evilx < 100)
    {
      for(int i = 0; i < 50; i++)
      {
        noStroke();
        ellipseMode(CENTER);
        fill(colourx, random(0, 100), random(0, 100));
        ellipse(random(mouseX - 80, mouseX + 80), random(mouseY - 80, mouseY + 80), random(30, 60), random(30, 60));
      }
    }
    if (evilx >= 100)
    {
      for(int i = 0; i < 70; i++)
      {
        noStroke();
        ellipseMode(CENTER);
        fill(colourx, random(0, 100), random(0, 100));
        ellipse(mouseX, random(0, width), random(30, 60), random(30, 60));
        ellipse(random(0, height), mouseY, random(30, 60), random(30, 60));
      }
    }
}


