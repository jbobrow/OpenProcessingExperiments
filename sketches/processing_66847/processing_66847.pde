


float ax, ay, aSize, axSpeed, aySpeed;
float bx, by, bSize, bxSpeed, bySpeed;
float cx, cy, cSize, cxSpeed, cySpeed;
float dx, dy, dSize, dxSpeed, dySpeed;
float ex, ey, eSize, exSpeed, eySpeed;


PImage a;
PImage b;
PImage c;
PImage d;
PImage e;

int numFrames = 7;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];

int _x;             //  used to determine position of all lines.
int _w, _h;         //  used to store x and y for centre of the screen, just for convenience sake
String _title = "VICTORY";
PFont _font;

void setup() {
  size(640, 360);
  background(255);
  smooth();
  frameRate(30);
  
  _w = width/2;
  _h = height/2;
  _x = _w;
  _font = loadFont("Rockwell-125.vlw");   
  textFont(_font, 125); 
  fill(0);     
  text(_title, _w - (textWidth(_title)/2), _h + 24);  //  centre the text on the screen
  
  images[0]  = loadImage("V.jpg");
  images[1]  = loadImage("I.jpg"); 
  images[2]  = loadImage("C.jpg");
  images[3]  = loadImage("T.jpg"); 
  images[4]  = loadImage("O.jpg");
  images[5]  = loadImage("R.jpg"); 
  images[6]  = loadImage("Y.jpg");
 

  // Bouncing figure setup
  a = loadImage("1.png");
  ax = noise(width);
  ay = random(height);
  aSize = 100;
  axSpeed = 10;
  aySpeed = 3;

  b = loadImage("2.png");
  bx = noise(width);
  by = random(height);
  bSize = 50;
  bxSpeed = 20;
  bySpeed = 10;

  c = loadImage("3.png");
  cx = noise(width);
  cy = random(height);
  cSize = 100;
  cxSpeed = 25;
  cySpeed = 10;
  
  d = loadImage("4.png");
  dx = noise(width);
  dy = random(height);
  dSize = 100;
  dxSpeed = 10;
  dySpeed = 3;
  
  e = loadImage("5.png");
  ex = noise(width);
  ey = random(height);
  eSize = 100;
  exSpeed = 15;
  eySpeed = 2;
  
}

void draw()
{
  background(255);
  smooth();

  
  { 
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 0, 10);
}

  moveLogo1();
  drawLogo1();
  moveLogo2();
  drawLogo2();
  moveLogo3();
  drawLogo3();
  moveLogo4();
  drawLogo4();
  moveLogo5();
  drawLogo5();
  
  {
      
  fill(0);      //  fill of the text
  text(_title, _w - (textWidth(_title)/2), _h+50);  //  centre the text on the screen
  }
}




// Drawing of Logo1

void drawLogo1()
{
  smooth();
  image (a, ax, ay, aSize, aSize);
}

void moveLogo1()
{
  ax = ax + axSpeed;
  if (ax+(aSize/2) > width)
  {
    axSpeed = -axSpeed;
  }
  else if (ax-(aSize/2) < -100)
  {
    axSpeed = -axSpeed;
  }

  ay = ay + aySpeed;
  if (ay+(aSize/2) > height)
  {
    aySpeed = -aySpeed;
  }
  else if (ay-(aSize/2) < -100)
  {
    aySpeed = -aySpeed;
  }
}

// Drawing of Logo2

void drawLogo2()
{
  smooth();
  image (b, bx, by, bSize, bSize);
}

void moveLogo2()
{
  bx = bx + bxSpeed;
  if (bx+(bSize/2) > width)
  {
    bxSpeed = -bxSpeed;
  }
  else if (bx-(bSize/2) < -50)
  {
    bxSpeed = -bxSpeed;
  }

  by = by + bySpeed;
  if (by+(bSize/2) > height)
  {
    bySpeed = -bySpeed;
  }
  else if (by-(bSize/2) < -50)
  {
    bySpeed = -bySpeed;
  }
}


// Drawing of Logo3

void drawLogo3()
{
  smooth();
  image (c, cx, cy, cSize, cSize);
}

void moveLogo3()
{
  cx = cx + cxSpeed;
  if (cx+(cSize/2) > width)
  {
    cxSpeed = -cxSpeed;
  }
  else if (cx-(cSize/2) < -100)
  {
    cxSpeed = -cxSpeed;
  }

  cy = cy + cySpeed;
  if (cy+(cSize/2) > height)
  {
    cySpeed = -cySpeed;
  }
  else if (cy-(cSize/2) < -100)
  {
    cySpeed = -cySpeed;
  }
}

// Drawing of Logo4

void drawLogo4()
{
  smooth();
  image (d, dx, dy, dSize, dSize);
}

void moveLogo4()
{
  dx = dx + dxSpeed;
  if (dx+(dSize/2) > width)
  {
    dxSpeed = -dxSpeed;
  }
  else if (dx-(dSize/2) < -100)
  {
    dxSpeed = -dxSpeed;
  }

  dy = dy + dySpeed;
  if (dy+(dSize/2) > height)
  {
    dySpeed = -dySpeed;
  }
  else if (dy-(dSize/2) < -100)
  {
    dySpeed = -dySpeed;
  }
}

// Drawing of Logo5

void drawLogo5()
{
  smooth();
  image (e, ex, ey, eSize, eSize);
}

void moveLogo5()
{
  ex = ex + exSpeed;
  if (ex+(eSize/2) > width)
  {
    exSpeed = -exSpeed;
  }
  else if (ex-(eSize/2) < -100)
  {
    exSpeed = -exSpeed;
  }

  ey = ey + eySpeed;
  if (ey+(eSize/2) > height)
  {
    eySpeed = -eySpeed;
  }
  else if (ey-(eSize/2) < -100)
  {
    eySpeed = -eySpeed;
  }
}



