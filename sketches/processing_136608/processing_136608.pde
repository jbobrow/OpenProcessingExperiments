
final int NB_MAX = 16;
int NB = (int)random(2, NB_MAX);
final int RADIUS = 220;
PVector prevPoint1 = new PVector(0, 0);
PVector prevPoint2 = new PVector(0, 0);
float R;
float G;
float B;
float Rspeed;
float Gspeed;
float Bspeed;
float count = 0;

void setup()
{
  size(500, 500, P3D);
  background(50);
  strokeWeight(2);
  generateColors();
}

void draw()
{
  smooth();
  fill(120, 10);
  noStroke();

  translate(500/2, 500/2);
  float thetaD = map(mouseX, 0, width, -.05, .05);
  float theta = random(TWO_PI / NB);

  Rspeed = ((R += Rspeed) > 255 || (R < 0)) ? -Rspeed : Rspeed;
  Gspeed = ((G += Gspeed) > 255 || (G < 0)) ? -Gspeed : Gspeed;
  Bspeed = ((B += Bspeed) > 255 || (B < 0)) ? -Bspeed : Bspeed;
  color myColor = color(R, G, B);
  fill(myColor, 70);
  stroke(myColor, 70);
  float angle = random(TWO_PI);

  float radius = random(8);

  float tmpX = prevPoint1.x + radius * cos(angle);
  float tmpY = prevPoint1.y + radius * sin(angle);
  
  //adding the mouse rotation
  float x = tmpX * cos(thetaD) - tmpY * sin(thetaD);
  float y = tmpY * cos(thetaD) + tmpX * sin(thetaD);
  
  
  if (x * x + y * y > RADIUS * RADIUS)
  {
    x = RADIUS * cos(atan2(prevPoint1.y, prevPoint1.x));
    y = RADIUS * sin(atan2(prevPoint1.y, prevPoint1.x));
  }

  for (int i = 0; i < NB; i++)
  {    
    rotate(TWO_PI / NB);
    //    point(x, y);
    //    point(x, -y);
    line(prevPoint1.x, prevPoint1.y, x, y);
    line(prevPoint2.x, prevPoint2.y, x, -y);
    //    ellipse(x, y, radius, radius);
    //    ellipse(x, -y, radius, radius);
  }
  prevPoint1 = new PVector(x, y);
  prevPoint2 = new PVector(x, -y);
}

void generateColors()
{
  R = random(255);
  G = random(255);
  B = random(255);
  Rspeed = (random(1) > .5 ? 1 : -1) * random(.8, 1.5);
  Gspeed = (random(1) > .5 ? 1 : -1) * random(.8, 1.5);
  Bspeed = (random(1) > .5 ? 1 : -1) * random(.8, 1.5);
}

void mousePressed()
{
  background(50);
  NB = (int)map(mouseX, 0, width, 2, NB_MAX);
  prevPoint1 = new PVector(0, 0);
  prevPoint2 = new PVector(0, 0);
  generateColors();
}

