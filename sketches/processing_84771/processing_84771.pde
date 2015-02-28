
// Snowfall simulation
// Samuel Arbesman
// 2013

int numFlakes = 700;
Flake[] flakes = new Flake[numFlakes];
float angleRange = 0.1;

void setup() {
  size(600, 400);
  smooth();
  frameRate(24);

  for (int i = 0; i < numFlakes; i++)
  {
    int cX = int(random(width));
    int cY = int(random(height));
    float angle = random(100)/100.*angleRange+HALF_PI-angleRange/2;

    flakes[i] = new Flake(cX, cY, angle);
  }
}


void draw() {
  background(22, 26, 50);

  for (int i=0;i<numFlakes;i++)
  {
    flakes[i].run();
  }
}



class Flake
{
  int x, y;
  float angle;
  int flakeSize = int(random(2, 5));
  boolean ground;

  float inc = random(3, 6);

  Flake(int xin, int yin, float angleIn)
  {
    x = xin;
    y = yin;
    angle = angleIn;
  }

  void run()
  {
    x += inc*cos(angle);
    y += inc*sin(angle);

    angle += random(-100, 100)/10000.;

    if (y > height)
    {
      y = 0;
      x = int(random(width));
      angle = random(100)/100.*angleRange+HALF_PI-angleRange/2;
    }


    if (x>0) {
      fill(256, 256, 256);
      stroke(256, 256, 256);
      ellipse(x, y, flakeSize, flakeSize);
    }
  }
}



