
Ball [] b = new Ball[200];

void setup()
{
  size(500, 500);
  smooth();
  for (int i=0; i<b.length; i++)
  b[i] = new Ball(
    random(20, width-20), 
    random(20, height-20),
    4, 4);
  
}

void draw()
{
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);
  for (int i=0; i<b.length; i++)
  {
  b[i].show();
  b[i].move();
  }
}


class Ball
{
  float x, y, size;
  float speed;
  
  Ball(float x_, float y_, float sz, float s)
  {
  x = x_;
  y = y_;
  size = 4;
  speed = s;
  }
  
  void show()
  {
  noStroke();
  fill(124, 252, 0);
  ellipseMode(CENTER);
  ellipse(x,y,size,size);
  noFill();
  stroke(124, 252, 0);
  ellipse(x+random(-50, 50),y+random(-10, 10),size,size);

  
  }
  
  void move()
  {
  x+=random(-speed, speed);
  y+=random(-speed, speed);
  
  }
}


