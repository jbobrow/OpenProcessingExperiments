
// Samantha Chiu hw5 2014

//global variables
float x=0, y=0;
float d =30, s =1; 
color e1 = color(145, 252, 182);

float xx = 390, yy = 390;
float dd = 40, ss =3;
color e2 = color(145, 223, 252);

void setup ()
{
  size(400,400);
  noStroke();
 
  //rect (0,0, width,height);
  
  d = 15;
  s = 1;
  
}

void draw ()
{
  prepWindow();
  moveFigures();
  drawFigures();
}

void prepWindow()
{
  noStroke();
  fill (252,252,139,200);
  rect(0, 0, width, height);
}
  
void drawFigures()
{
  ellipseMode(CORNER);
  figure(x, y, d);
  figure(xx, yy, dd, e2);
}
  
//ball 1
void figure(float x, float y, float d)
{
  noStroke();
  fill(e1);
  ellipse(x, y, d, d);
}
  
//ball 2
void figure(float xx, float yy, float dd, color e2)
{
  noStroke();
  fill(e2);
  ellipse(xx, yy, dd, dd);
}
  
void moveFigures()
{
  //ball 1 movement
  if ((x < width - d) && (y == height - height)) {
    x += s;
  }
  else if ((x > width - width) && (y >= height - d)) {
    x -= s;
  }
  else if ((x >= width - d) && (y <= height - d)) {
    y += s;
  }
  else if ((x <= d) && (y > height - height)) {
    y -= s;
  }
 
    
  //ball 2 movement
  if ((xx < width - dd) && (yy == height - height)) {
    xx += ss;
  }
  else if ((xx > width - width) && (yy >= height - dd)) {
    xx -= ss;
  }
   else if ((xx >= width - dd) && (yy <= height - dd)) {
    yy += ss;
  }
  else if ((xx <= dd) && (yy > height - height)) {
    yy -= ss;
  }
}



