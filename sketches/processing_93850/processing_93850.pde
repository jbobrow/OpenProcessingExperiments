
/* @pjs font="EvilFont.vlw"; preload = "Face_Blast.png, Face_Charged.png, Face_Charging.png, Face_MegaBlast.png, Face_Neutral.png"; */

// Borrowing code from http://www.openprocessing.org/sketch/49243

MadAlien xenocide;

Bullet bullet1;
Bullet bullet2;
Bullet bullet3;
Bullet bullet4;
Bullet bullet5;

Laser mouseLaser;

// Set the score limit to win and the time limit to lose
int maxEvil = 500;
int timeLimit = 40;

float time = 0;
int clock = 0;
int evil = 0;
int colour;
int protection;
boolean crazyOn;
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
  ellipseMode(RADIUS);
  colorMode(HSB, 360, 100, 100, 100);
  
  neutral = loadImage("Face_Neutral.png");
  charging = loadImage("Face_Charging.png");
  charged = loadImage("Face_Charged.png");
  blast = loadImage("Face_Blast.png");
  megablast = loadImage("Face_MegaBlast.png");
  font = loadFont("EvilFont.vlw");
  textFont(font, 90);
  textMode(CENTER);
  
  bullet1 = new Bullet(200, 800);
  bullet2 = new Bullet(300, 800);
  bullet3 = new Bullet(400, 800);
  bullet4 = new Bullet(500, 800);
  bullet5 = new Bullet(600, 800);
  
  mouseLaser = new Laser();
  
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
  
  time += 0.0167;
  
  // Make Xeno's face change based on his current evil charge
  evilFace(evil);
  
  updateBullets();
  
  // Fire a laser
  if(mousePressed && (mouseButton == LEFT))
  {
    crazyOn = false;
    xenocide.image = blast;
    laserBlaster(colour, evil, crazyOn);
    mouseLaser.update();
    destroyBullet(bullet1);
    destroyBullet(bullet2);
    destroyBullet(bullet3);
    destroyBullet(bullet4);
    destroyBullet(bullet5);
  }
  else if (mousePressed && (mouseButton == RIGHT))
  {
    crazyOn = true;
    xenocide.image = megablast;
    laserBlaster(colour, evil, crazyOn);
    if (evil != 0)
    {evil--;}
    destroyBullet(bullet2);
    destroyBullet(bullet3);
    destroyBullet(bullet4);
    destroyBullet(bullet5);
  }
  mouseLaser.update();
  
  // Make Xeno's barrier appear
  laserBarrier(colour, evil);
  
  // Make Xeno show up
  image(xenocide.image, width/2, 120);
  
  // Tick clock and display remaining time
  if (time >= 1)
  {
    clock++;
    time = 0;
  }
  fill(0, 0, 0);
  text("Time:", 230, 770);
  text(clock, 480, 770);
  
  // End the game one way or another
  if (evil >= maxEvil)
  {
    gameEnd();
    background(0, 100, 100);
    fill(colour, random(0, 100), random(0, 100));
    text("YOU WIN", 200, 400);
    time = 0;
    clock = 0;
  }
  else if (clock >= timeLimit)
  {
    gameEnd();
    background(0, 0, 0);
    fill(colour, random(0, 100), random(0, 100));
    text("YOU LOSE", 200, 400);
    evil = 0;
    time = 0;
  }
}

// Make Xeno's face return to non-blasting state.
void mouseReleased()
{
  xenocide.image = neutral;
}

// Use WASD to create a barrier or charge up evil power
void keyReleased()
{
  if (key == 'w')
  {
    evil += 5;
    if (evil > maxEvil)
    {evil = maxEvil;}
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

void evilFace(int evilx)
{
  if(evilx < 50)
  {
    xenocide.image = neutral;
  }
  else if(evilx > 100 && evilx < 600)
  {
    xenocide.image = charging;
  }
  else if(evilx >= 600)
  {
    xenocide.image = charged;
  }
}

// Set up a barrier whenever evil isn't being charged.
void laserBarrier(int colourx, int evilx)
{
  for(int i = 0; i < 50; i++)
  {
    noStroke();
    rectMode(CENTER);
    fill(colourx, random(0, 100), random(0, 100));
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

// Fire a laser when the left mouse button is clicked.
void laserBlaster(int colourx, int evilx, boolean crazyOnx)
{
    if (crazyOnx == false)
    {
      for(int i = 0; i < 40; i++)
      {
        noStroke();
        fill(colourx, random(50, 100), random(50, 100));
        ellipse(random(mouseX - 50, mouseX + 50), random(mouseY - 50, mouseY + 50), random(30, 60), random(30, 60));
      }
    }
    if (crazyOnx == true)
    {
      for(int i = 0; i < 70; i++)
      {
        noStroke();
        fill(colourx, random(0, 100), random(0, 100));
        ellipse(random(mouseX - 100, mouseX + 100), random(mouseY - 100, mouseY + 100), random(30, 60), random(30, 60));
      }
    }
}

void updateBullets()
{
  bullet1.update();
  bullet2.update();
  bullet3.update();
  bullet4.update();
  bullet5.update();
}

boolean circlesCollided (int x1, int y1, int x2, int y2, int radius1, int radius2)
{
  if (dist(x1, y1, x2, y2) < (radius1 + radius2))
  {return true;}
  else
  {return false;}
}
  
void destroyBullet (Bullet bullet)
{
  if (circlesCollided (bullet.x, bullet.y, mouseLaser.x, mouseLaser.y, 20, mouseLaser.radius))
  {
  bullet.y = 800;
  bullet.x = int(random(20, 770));
  evil++;
  }
}

void gameEnd()
{
  bullet1.speed = 0;
  bullet2.speed = 0;
  bullet3.speed = 0;
  bullet4.speed = 0;
  bullet5.speed = 0;
}
    
// Keep track of Xeno's image.
class MadAlien
{
 PImage image;
}
// Keep track of the time-eating bullets
class Bullet
{
  int x;
  int y;
  float speed = -10;
  
  Bullet(int xpos, int ypos)
  {
    x = xpos;
    y = ypos;
  }
  
  void update()
  {
    y += speed;
    
    fill(colour, 100, 100);
    noStroke();
    ellipse(x, y, 20, 20);
    
    // Determine the effects of a collision with Xeno or a barrier
    if (y <= 250 && protection == 1 && x <= 250)
    {
      fill(0, 0, 0);
      ellipse(x, y, 60, 60);
      y = 800;
      x = int(random(20, 770));
      evil++;
    }
    else if (y <= 250 && protection == 2 && x > 250 && x < 550)
    {
      fill(0, 0, 0);
      ellipse(x, y, 60, 60);
      y = 800;
      x = int(random(20, 770));
      evil++;
    }
    else if (y <= 250 && protection == 3 && x >= 550)
    {
      fill(0, 0, 0);
      ellipse(x, y, 60, 60);
      y = 800;
      x = int(random(20, 770));
      evil++;
    }
    else if (y <= 180)
    {
      fill(0, 100, 100);
      ellipse(x, y, 60, 60);
      y = 800;
      x = int(random(20, 770));
      clock += 1;
    }
  }
}
// Keep track of the mouse-click laser
class Laser
{
  int x;
  int y;
  int radius;
  
  void update()
  {
    if (mousePressed)
    {
      x = mouseX;
      y = mouseY;
      
      if (crazyOn == true)
      {radius = 150;}
      else if (crazyOn == false)
      {radius = 95;}
      
      //fill(colour, 100, 100);
      //ellipse(x, y, radius, radius);
    }
    else
    {
      x = 0;
      y = 0;
      radius = 0;
    }
  }
}


