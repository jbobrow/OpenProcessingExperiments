
float x = 60; //x
float y = 440; // y
int radius = 45; //head's radius
int bodyHeight = 160; //body's height
int neckHeight = 70; // neck's height

float easing = 0.02;

void setup()
{
  size(170, 480);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}

void draw()
{
  int targetX = mouseX;
  x += (targetX - x) * easing;
  if(mousePressed)
  {
    neckHeight = 16;
    bodyHeight = 90;
  }else
  {
    neckHeight = 70;
    bodyHeight = 160;
  }
  float ny = y - bodyHeight - neckHeight - radius;
  
  background(204);
  
  //neck
  stroke(102);
line(x+2, y-bodyHeight, x+2, ny);
  line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);


  //antenna
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);


  //body
  noStroke();
  fill(102);
  ellipse(x, y-33, 33, 33);
  fill(0);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(102);
rect(x-45, y-bodyHeight+17, 90, 6);

  //head
  fill(0);
  ellipse(x+12, ny, radius, radius);
  fill(255);
  ellipse(x+24, ny-6, 14, 14);
  fill(0);
  ellipse(x+24, ny-6, 3, 3);
fill(153);
ellipse(x, ny-8, 5, 5);
ellipse(x+30, ny-26, 4, 4);
ellipse(x+41, ny+6, 3, 3);//y = 390 //460 //310 //420
////bodyHeight = 180 // 260 //80 //110
////neckHeight = 40 //95 //10 //140
}

