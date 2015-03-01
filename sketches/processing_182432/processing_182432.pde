
ArrayList<Circle> circles = new ArrayList<Circle>();
boolean keyspace,keyup,keydown,keyright,keyleft;

void setup()
{
  size(1000,1000);
  background(0);
  noStroke();
  for (int i = 0; i < 2500; i++)
  {
    circles.add(new Circle());
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < circles.size(); i++)
  {
    Circle c1 = circles.get(i);
    c1.display();
    c1.velocity();
    c1.Color();
    if (keyspace) c1.swap();
    if (keyup)    c1.flash();
    if (keydown)  c1.center();
    if (keyright) c1.right();
    if (keyleft)  c1.left();
  }
}

void keyPressed()
{
  if (keyCode == ' ')   keyspace = true;
  if (keyCode == RIGHT) keyright = true;
  if (keyCode == LEFT)  keyleft = true;
  if (keyCode == DOWN)  keydown = true;
  if (keyCode == UP)    keyup = true;
}

void keyReleased()
{
  if (keyCode == ' ')   keyspace = false;
  if (keyCode == RIGHT) keyright = false;
  if (keyCode == LEFT)  keyleft = false;
  if (keyCode == DOWN)  keydown = false;
  if (keyCode == UP)    keyup = false;
}

class Circle
{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float a;
  float b;
  float d;
  float g;
  float o;
  float r;
 
  Circle()
  {
    xpos = width/2;
    ypos = height/2;
    xvel = random(-5,5);
    yvel = random(-5,5);
    o = 500; 
    a =1;
  }
  
  
  void velocity()
  {
    xpos = xpos + xvel/2 /*+ mouseX/50*/;
    ypos = ypos +yvel/2 /*+ mouseY/50*/;
    if (xpos > width)
    { 
      xpos = 0;
    }
    else if (xpos < 0)
    {
      xpos = width;
    }
    if (ypos > height)
    {
      ypos = 0;
    }
    else if (ypos < 0)
    {
      ypos = height;
    }
  }
  
  void right()
  {
    xvel = xvel + 1;
    if (xvel > 50)
    {
      xvel = xvel - 10;
    }
  }
  
  void left()
  {
    xvel = xvel - 1;
    if (xvel < -50)
    {
      xvel = xvel + 10;
    }
  }
    
  void center()
  {
    xpos = width/2;
    ypos = width/2;
    xvel = random(-5,5);
    yvel = random(-5,5);
    /*xvel = random(5);
    yvel = random(-5);*/
  }
  
  void flash()
  {
    if (o > 0)
    {
      o = o - 10;
    }
    if (o == 0)
    {
      o = 500;
    }
  }
  
  void swap()
  {
     if (xpos > width/2)
    {
      b = 0;
      r = 255;
      if (ypos > height/2)
      {
        b = 255;
        r = 0;
      }
    }
    if (xpos < width/2)
    {
      b = 0;
      r = 255;
      if (ypos < height/2)
      {
        r = 0;
        b = 255;
      }
    }
   }
    
  
  void Color()
  {
    if (xpos > width/2)
    {
      b = 255;
      r = 0;
      if (ypos > height/2)
      {
        b = 0;
        r = 255;
      }
    }
    if (xpos < width/2)
    {
      b = 255;
      r = 0;
      if (ypos < height/2)
      {
        r = 255;
        b = 0;
      }
    }
  }
  
  void display()
  {
    fill(r,g,b,o);
    ellipse(xpos,ypos,5,5);
  }
}
  


