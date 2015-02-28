
Balloon b;
ArrayList<Balloon> balloons;

void setup()
{
  size(700, 400);
  frameRate(60);
  background(0);
  smooth();
  b = new Balloon();
  balloons = new ArrayList<Balloon>();
  fill(255);
}

void draw() {

  background(0);
  stroke(255);
  noStroke();

  for (int i = 0; i < balloons.size(); i++)
  {
    balloons.get(i).draw();
  }
}

void mouseReleased()
{ 
  b = new Balloon();
  balloons.add(b);
}

class Balloon
{
  float x;
  float y;
  float growth;

  Balloon()
  {
    x = random(0, 700);
    y = random(0, 400);
    growth = 0;
  }

  void draw()
  {
    float dx = x - mouseX;
    float dy = y - mouseY;
    float balloonRadius = (5 + (growth/2) + 20);

    if (((dx*dx) + (dy*dy)) < (balloonRadius * balloonRadius))
    {
      growth = growth + 1;
    }
    else 
    {
      growth = growth + 0.1;
    }
    ellipse(x, y, 10 + growth, 10 + growth);

    for (Balloon b : balloons) {
      ellipse(b.x, b.y, 10 + b.growth, 10 + b.growth);
    }
  }
}



