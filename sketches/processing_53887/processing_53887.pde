
//copyright benjamin corwin 2012

int arraylength = 100;//edit for number of shapes
int [] radiusX = new int [arraylength];
int [] locationX = new int [arraylength];
int [] locationY = new int [arraylength];
color[] arraycolor = new color[arraylength];

void setup()
{
  smooth();
  size(500,500);
  background(255);
  radiusXSetup();
  arraycolorSetup();
  locationX();
  locationY();
}
void draw()
{
  drawEllipses();
  drawLines();
  noLoop();
}
void arraycolorSetup()
{
  for (int i = 0; i<arraycolor.length; i++)
  {
    arraycolor[i] = color(int(random(0,255)),int(random(0,255)),int(random(0,255)),int(random(100,200)));
  }
}

void locationX()
{
  for ( int i = 0; i < locationX.length; i ++)
  {
    locationX[i] = int(random(0,width));
  }
}

void locationY()
{
  for ( int i = 0; i < locationY.length; i ++)
  {
    locationY[i] = int(random(0,height));
  }
}

void radiusXSetup()
{
  for ( int i = 0; i < radiusX.length; i ++)
  {
    radiusX[i] = int(random(10,100));
  }
}

void drawEllipses()
{
  for(int i = 0; i< arraylength; i = i + 1)
  {
    noStroke();
    fill(arraycolor[i]);
    ellipse(locationX[i], locationY[i], radiusX[i], radiusX[i]);
  }
}
void drawLines()
{
  stroke(50,15);
  strokeWeight(1);
  for(int i = 0; i< arraylength; i = i +1)
  {
    point(locationX[i], locationY[i]);
    for(int n = 0; n + i < arraylength; n = n + 1)
    {
      line(locationX[i], locationY[i], locationX[i+n],locationY[i+n]);
    }
  }
}


