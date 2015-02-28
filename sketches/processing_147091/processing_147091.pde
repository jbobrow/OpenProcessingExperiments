
PVector points[] = new PVector[3];
PVector location;
int n= 0;

void setup() {

  size(600, 600);
  for (int c = 0; c < points.length; c++)
  {
    float a = c*PI*2.0/(points.length*1.0);
    float s = 0.4;
    float x = width/2+sin(a)*width*s;
    float y = height/2+cos(a)*height*s;
    points[c] = new PVector(x, y);
  }
  location = new PVector(width/2.0, height/2.0);
  background(255);
}

void draw()
{
  for (int c = 0; c< 100; c++)
  {
    n++;
    int r = int(random(points.length));
    PVector point = points[r];
    location.x = (location.x+point.x)/2.0;
    location.y = (location.y+point.y)/2.0;
    fill(0);
    rect(location.x, location.y,1,1);
  }
  println(n);
}

