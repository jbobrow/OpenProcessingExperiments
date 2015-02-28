
// Homework #7 48-257
// Humaira Tasnim htasnim Copyright 2012

int count;

float bx, by, bd, bxSpeed, bySpeed;
float px, py, pSize, pxSpeed, pySpeed;

PImage p;
PImage b;
PImage bg;

void setup()
{
  size(500,500);

  textSize(18);
  textAlign(LEFT);
  imageMode(CENTER);
  count = 0;
  
  // Background setup
  bg = loadImage("background.jpg");

  // Bouncing figure setup
  p = loadImage("KingPig.png");
  px = random(width);
  py = random(height);
  pSize = 100;
  pxSpeed = 2;
  pySpeed = 2;

  // Mouse-controlled figure setup 
  b = loadImage("AngryRedBird.png");
  bx = random(width);
  by = random(height);
  bd = 100;
  bxSpeed = 2;
  bySpeed = 2;
}

void draw()
{
  prepareScreen();
  moveBird();
  drawBird();
  movePig();
  drawPig();
  checkCollision();
  showStats();
}


// Screen setup

void prepareScreen()
{
  image (bg, 250, 250, width, height);
}


// Drawing and Bouncing of Pig

void drawPig()
{
  smooth();
  image (p, px, py, pSize, pSize);
}

void movePig()
{
  px = px + pxSpeed;
  if (px+(pSize/2) > width)
  {
    pxSpeed = -pxSpeed;
  }
  else if (px-(pSize/2) < 0)
  {
    pxSpeed = -pxSpeed;
  }
   
  py = py + pySpeed;
  if (py+(pSize/2) > height)
  {
    pySpeed = -pySpeed;
  }
  else if (py-(pSize/2) < 0)
  {
    pySpeed = -pySpeed;
  }
}


// Drawing and Wrapping of Angry Bird

void drawBird()
{
  smooth();
  image (b, bx, by, bd, bd);
}

void moveBird()
{
  bx += bxSpeed;
  if (bx > width + bd/2)
  {
    bx = 0 + bd/2;
  }
     
  if (bx < 0 - bd/2)
  {
    bx = width - bd/2;
  }
     
  by += bySpeed;
  if (by > height + bd/2)
  {
    by = 0 + bd/2;
  }
     
  if (by < 0 - bd/2)
  {
    by = height - bd/2;
  }
}

void mouseDragged( )
{
  if (mouseX > pmouseX)
  {
    bxSpeed+=0.1;
  }
  else if (mouseX < pmouseX)
  {
    bxSpeed-=0.1;
  }
  if (mouseY > pmouseY)
  {
    bySpeed+=0.1;
  }
  else if (mouseY < pmouseY)
  {
    bySpeed-=0.1;
  }
}


// Check for collision

void checkCollision()
{
  float d = dist(px, py, bx, by);
  if (d <= pSize)
  {
    background(255, 0, 0);
    px = random(50, width-50);
    py = random(50, height-50);
    pxSpeed = random(2, 5);
    pySpeed = random(2, 5);
    count++;
  }
}


// Show stats

void showStats()
{
  fill(0);
  text("Number of collisions: " + count, width/8, height/8);
  text("Time: " + millis()/1000 + " seconds", width/8, (height/8)+40);
}

