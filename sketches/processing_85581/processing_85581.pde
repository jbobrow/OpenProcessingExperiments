
int NUM_THINGS = 17;
Thing[] things = new Thing[NUM_THINGS];
int NUM_THINGS2 = 21;
Thing2[] things2 = new Thing2[NUM_THINGS2];
int NUM_THINGS3 = 27;
Thing3[] things3 = new Thing3[NUM_THINGS3];

void setup() 
{
  size(500, 500); 
  smooth();
  for (int i = 0; i < NUM_THINGS; i++) 
  {
    things[i] = new Thing();   
    things[i].x = random(0, width);
    things[i].y = random(0, height);
    things[i].direction = random(0,0);
  }
  for (int i = 0; i < NUM_THINGS2; i++) 
  {
    things2[i] = new Thing2();   
    things2[i].x = random(3, width);
    things2[i].y = random(3, height);
    things2[i].direction = random(0,0);
  }
  for (int i = 0; i < NUM_THINGS3; i++) 
  {
    things3[i] = new Thing3(); 
    things3[i].x = random(0, width);
    things3[i].y = random(0, height);
    things3[i].direction = random(0, 360);
  }
}
void draw() 
  { 
  background(51,51,51);
  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i].update();
  }
  for (int i = 0; i < NUM_THINGS2; i++)
  {
    things2[i].update();
  }
  for (int i = 0; i < NUM_THINGS3; i++)
  {
    things3[i].update();
  }
}
class Thing
{
  float myDiameter = random(4, 17);
  float x = width;
  float y = height;
  color col = #E80C0C;
  float speed = 7;
  float direction = 0;
  float force = 60;
  Thing()
  {
  }
  void update()
  {   
    float dX = cos(radians(direction))*speed;
    float dY = sin(radians(direction))*speed;
    x = x + dX;
    y = y + dY;
    if (x > width)
    {
      x = 0;
    }
    if (x < 0)
    {
      x = width;
    }
    if (y > height)
    {
      y = 0;
    }
    if (y < 0)
    {
      y = height;
    }
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
    for (int i = 0; i < NUM_THINGS; i++)
    {
      Thing other = things[i];
      if (this != other)
      {
        if (dist(x, y, other.x, other.y)<100)
        {
          stroke(255);
          line(x, y, other.x, other.y);
        }
      }
    }
  }
}
class Thing2
{
  float myDiameter = 18;
  float x = width;
  float y = height;
  color col = #30AA0C;
  float speed = 1.5;
  float direction = 0;
  float force = 1;
  Thing2()
  {
  }
  void update()
  {
    float dX = cos(radians(direction))*speed;
    float dY = sin(radians(direction))*speed;
    x = x + dX;
    y = y + dY;
    direction++;
    if (x > width)
    {
      x = 0;
    }
    if (x < 0)
    {
      x = width;
    }
    if (y > height)
    {
      y = 0;
    }
    if (y < 0)
    {
      y = height;
    }
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
    for (int i = 0; i < NUM_THINGS2; i++)
    {
      Thing3 other = things3[i];
      {
        if (dist(x, y, other.x, other.y)<100)
        {
          stroke(0,0,255);
          line(x, y, other.x, other.y);
        }
      }
    }
  }
}
class Thing3
{
  float myDiameter = 13;
  float x = width;
  float y = height;
  color col = #F1F7F0;
  float speed = 0.8;
  float direction = 0;
  Thing3()
  {
  }
  void update()
  {
    float dX = cos(radians(direction))*speed;
    float dY = sin(radians(direction))*speed;
    x = x + dX;
    y = y + dY;
    if (x > width)
    {
      x = 0;
    }
    if (x < 0)
    {
      x = width;
    }
    if (y > height)
    {
      y = 0;
    }
    if (y < 0)
    {
      y = height;
    }
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
    for (int i = 0; i < NUM_THINGS; i++)
    {
      Thing other = things[i];
      {
       if (dist(x, y, other.x, other.y)<100)
        {
          stroke(255);
          line(x, y, other.x, other.y);
        }
      }
    }
   }
 }

