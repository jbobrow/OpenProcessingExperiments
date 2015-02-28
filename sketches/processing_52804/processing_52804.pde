
int numElements = 25;
Wiggler[] buddies = new Wiggler[numElements];

void setup()
{
  size(500, 500);
  smooth(); 
  for (int i=0; i<buddies.length; i++)
  {
    float startx = random(50, width-50);
    float starty = random(50, height-50);
    float rspeed = random(2, 4);
    buddies[i] = new Wiggler(startx, starty, rspeed); // Construct one random wiggler
  }
}
void draw()
{
  fill(0, 10); 
  noStroke();
  rect(0, 0, width, height);
  for (int i=0; i<buddies.length; i++)
  {
    buddies[i].display();
    buddies[i].update();
  }
}

class Wiggler
{
  float xpos, ypos;
  float speed;

  Wiggler(float x, float y, float s)
  {
    xpos = x;
    ypos = y;
    speed = s;
  }

  void update()
  {
    float rx = random(-speed, speed);
    float ry = random(-speed, speed);
    xpos+=rx;
    ypos+=ry;
  }
  void display()
  {
    stroke(50);
    fill(255);
    ellipse(xpos, ypos, 20, 20);
  }
}


