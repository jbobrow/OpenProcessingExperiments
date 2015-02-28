
//Ayako Matsuda
//DESMA 28 Interactivity Winter 2012

float x = 50.0; // X-coordinate
float y = 50.0; // Y- coordinate
float radius = 50.0; //Radius of the circe
float speedX = 3.0; // Speed of motion on the x-axis
float speedY = 1.0; // Speed of motion on the y-axis
int directionX = 1; //Direction of motion on the x-axis
int directionY = -1; //Direction of motion on the y-axis

float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 50;  // ellipse diameter

float angle= 0.0;


void setup ()
{
  size (640, 360);
  smooth (); 
  noStroke ();
  ellipseMode(RADIUS);

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = width * 0.66;
}

void draw()
{
  fill (0, 12);
  rect(0, 0, width, height);

  // circle
  if (dist(width * 0.66, height * 0.5, mouseX, mouseY) < ed)
  {
    fill (255);
    ellipse(x, y, radius, radius);
    x += speedX * directionX;
    if ((x > width-radius) || (x< radius))
    {
      directionX= -directionX; //Change direction
    }
    y += speedY * directionY;
    if ((y > height-radius) || (y < radius))
    {
      directionY= -directionY; //Change direction
    }
    if (mousePressed == true)
    {
      background(255);
      PFont font;
      font = loadFont("SansSerif-72.vlw");
      textFont(font);
      fill (0);
      text("Good Morning :)", 25, 200);
    }
  }

  else if ((mouseX< rx+rd) && (mouseX> rx) && (mouseY< ry+rd) && (mouseY>ry))
  { 
    if (mousePressed == true)
    {
      background (0,12);
      PFont font;
      font = loadFont("SansSerif-72.vlw");
      textFont(font);
      fill (255);
      text("Good Night :)", 75, 200);
    }
    else
    {
      fill (0, 12);
      rect (0, 0, width, height);
      fill(255);
      angle = angle + 0.02;
      translate (rx + rd/2, ry + rd/2);
      rotate (angle);
      rect (-30, -30, 60, 60);
    }
  }
  else
  {
    fill (0, 12);
    rect(0, 0, width, height);
    fill(255);
    rect(rx, ry, rd, rd);
    ellipse (width * 0.66, height * 0.5, ed, ed);
  }
}


