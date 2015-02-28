

ArrayList gravitywells;
float[] angles;
final double G = 6.67384 * pow(10, -6);
float x1 = 0;
float y1 = 0;
boolean useMouse = true;

void setup()
{
  size(600, 400, P2D);
  frameRate(200);
  background(0);
  smooth(); 
  restart();
}

void restart()
{
  background(0);
  gravitywells = new ArrayList();
  angles = new float[width * height];
  for(int i = 0; i < angles.length; i++)
    angles[i] = 0.0;
  redraw();
}

void mouseReleased()
{
  gravitywells.add(new GravityWell(mouseX, mouseY));
}

void keyReleased()
{
  if(key != CODED)
  {
    if(key == 82 || key == 114)
      restart();
    else if(key == 77 || key == 109)
      useMouse = !useMouse;
  }
}

void draw()
{
  for(int j = 0; j < height; j++)
  {
    for(int i = 0; i < width; i++)
    {
      x1 = 0;
      y1 = 0;
      for(int k = 0; k < gravitywells.size(); k++)
      {
        GravityWell g = (GravityWell) gravitywells.get(k);
        float r = dist(i, j, g.position.x, g.position.y);
        x1 += 10000 * ((-G * g.mass) / sq(r)) * (g.position.x - i);
        y1 += 10000 * ((-G * g.mass) / sq(r)) * (g.position.y - j);
      }
      if(useMouse)
      {
        float r = dist(i, j, mouseX, mouseY);
        x1 += 10000 * ((-G * 200000) / sq(r)) * (mouseX - i);
        y1 += 10000 * ((-G * 200000) / sq(r)) * (mouseY - j);
      }
      if(x1 < 0)
        angles[i + j * width] = atan(y1 / x1);
      else if(x1 > 0)
        angles[i + j * width] = HALF_PI - atan(y1 / x1);
      else
      {
        if(y1 > 0)
          angles[i + j * width] = -HALF_PI;
        else
          angles[i + j * width] = HALF_PI;
      }
    }
  }
  
  for(int j = 0; j < height; j++)
  {
    for(int i = 0; i < width; i++)
    {
      stroke(norm(angles[i + j * width], -PI, PI) * 255);
      point(i, j);
    }
  }
  
  noStroke();
  fill(255, 0, 0, 100);
  for(int i = 0; i < gravitywells.size(); i++)
  {
    GravityWell g = (GravityWell) gravitywells.get(i);
    ellipse(g.position.x, g.position.y, 10, 10);
  }
}

class GravityWell
{
  PVector position;
  float mass;
  
  protected GravityWell(float x, float y)
  {
    position = new PVector(x, y);
    mass = random(100000, 500000);
  }
}

