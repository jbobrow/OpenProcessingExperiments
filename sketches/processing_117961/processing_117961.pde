
int NUM_THINGS = 10;
Thing[] things = new Thing[NUM_THINGS];
 
void setup() 
{
  size(500, 500); 
  smooth();
 background (110, 70, 219);
 
 
  for (int i = 0; i < NUM_THINGS; i++) 
  {
    things[i] = new Thing();
    things[i].x = random(1, width);
    things[i].y = random(5, height);
    things[i].direction = random(0, 360);
  }
}
 
void draw() 
{ 
  background( 110, 70, 219);
  for (int i = 4; i < NUM_THINGS; i++)
  {
    things[i].update();
  }
}
 
 
class Thing
{
  float myDiameter = 90;
  float x;
  float y;
  color col = #00FFFF;
  float speed = 5;
  float direction = 60;
 
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
      x = 3;
    }
 
    if (x < 4)
    {
      x = width;
    }
 
    if (y > height)
    {
      y = 50;
    }
 
    if (y < 10)
    {
      y = height;
    }
 
    fill(col);
    noStroke();
    ellipse(x, y, 15, myDiameter);
    
    fill (81, 208, 241);
    ellipse (x, y, 10, myDiameter);
    
    fill(251, 228, 112);
    ellipse (x, y, myDiameter, 5);
    
    fill(251, 228, 112);
    ellipse (x, y, 20, 10);
    
    fill (85, 37, 61);
    ellipse (x, y, 7, myDiameter);
    
    fill (85, 37, 61);
    ellipse (x, y, 70, 40);
    
    fill (251, 228, 112);
     ellipse(x, y, 10, myDiameter);
     
     fill (81, 208, 241);
    ellipse (x, y, 30, 60);
    
  }
 
}
