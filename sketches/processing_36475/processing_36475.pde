
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

  Balloon()
  {
    x = random(0, 700);
    y = random(0, 400);
  }

  void draw()
  {
    ellipse(x, y, 10, 10);
  }
}



