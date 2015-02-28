
//Trevor Wilson
//1/24/2012


float speed = 3;
PFont font;

float rx, ry;    
float rd = 100;  

float ex, ey;    
float er = 52;  

void setup() 
{
  size(640, 360);
  smooth();
  ellipseMode(RADIUS);
  font = loadFont("ChickenButt-12.vlw");
  textFont(font);

  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() 
{
  background(0);
  fill(255);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, er, er);
  float d = dist(mouseX, mouseY, ex, ey);

  if (d < er)
  {
    textSize(24);
    fill(0);
    text("Click", ex-21, ey-12, er, er);
  }
  if (mousePressed == true & mouseButton == LEFT & d < er)
  {
    fill(131, 2, 159);
    ellipse(ex, ey, er, er);
    ex += random(-speed, speed);
    ey += random(-speed, speed);
  }

  if (mouseX > rx & mouseX < rx+100 & mouseY < ry +100 & mouseY > ry)
  {
    textSize(24);
    fill(0);
    text("Click", rx+30, ry+30, rd, rd);
  }

  if (mousePressed == true & mouseButton == LEFT)
  {
    if (mouseX > rx & mouseX < rx+100 & mouseY < ry +100 & mouseY > ry)
    {
      fill(0, 255, 24);
      rect(rx, ry, rd, rd);
      rx += random(-speed, speed);
      ry += random(-speed, speed);
    }
  }
}


