
void setup()
{
  size(400, 400);
  noStroke();
  smooth();
  //noCursor();
}

ArrayList sparkle = new ArrayList();

void draw()
{
  background(0);
  sparkelfy();
}

void mouseMoved()
{
  for (int i = 0; i < 3; i++)
    sparkle.add(new Sparkle(pmouseX, pmouseY));
}

void sparkelfy()
{
  for (int i = 0; i < sparkle.size(); i++)
  {
    Sparkle currentSparkle = (Sparkle)sparkle.get(i);
    if (currentSparkle.alive())
    {
      currentSparkle.make();
      currentSparkle.move();
    }
    else
    {
      sparkle.remove(i);
    }
  }
}
class Sparkle
{
  
  float xpos, ypos, angle, siz, col;
  
  Sparkle(float _x, float _y)
  {
    xpos = _x;
    ypos = _y;
    angle = random(2*PI);
    col = random(255);
    siz = 20;
  }
  
  void make()
  {
    pushMatrix();
    translate(xpos, ypos);
    rotate(angle);
    fill(0, 0, col, 255-siz*2);
    triangle(-siz/8, 0,
             siz/8, 0,
             0, -siz/2);
    popMatrix();
  }
  
  void move()
  {
    siz++;
  }
  
  boolean alive()
  {
    if (siz <= 127)  return true;  else  return false;
  }
}


