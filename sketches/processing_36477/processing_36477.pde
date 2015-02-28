
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
    boolean del;
    float balloonRadius = (5 + (growth/2) + 20);

    if (((dx*dx) + (dy*dy)) < (balloonRadius * balloonRadius))
    {
      growth = growth + 1;
      del = true;
    }
    else 
    {
      growth = growth + 0.1;
      del = true;
    }
    ellipse(x, y, 10 + growth, 10 + growth);

    del = false;

    for (int i = 0; i < balloons.size(); i++)
    {
      if (del == true)
      {
        break;
      }

      for (int j = 0; j < balloons.size(); j++)
      {
        if (i != j && balloons.get(i).touches(balloons.get(j)))
        {
          balloons.remove(i);
          balloons.remove(j-1);
          del = true;
          break;
        }
      }
    }

    background(0);
    for (Balloon b : balloons) {
      ellipse(b.x, b.y, 10 + b.growth, 10 + b.growth);
    }
  }

  boolean touches(Balloon other)
  {
    float dx = other.x - this.x;
    float dy = other.y - this.y;
    float distance = (5 + (other.growth/2)) + (5 + (this.growth/2));

    return (Math.hypot(dx, dy) < distance);
  }
}



