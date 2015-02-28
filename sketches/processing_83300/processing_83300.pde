
Ball joe;  
Paddle poe;
int a;
void setup()  
{  
  joe = new Ball();  
  poe = new Paddle();
  size(400, 400);
}  
void draw()  
{  
  background(0, 0, 0);    
  joe.move(); 
 poe.show();
  joe.bounce();  
  joe.show();  
  poe.move();
}
class Paddle
{
  int a;
  Paddle()
  {
    a = 200;
  }
  void show()
  {
 fill(252,10,168);
    rect(a, 350, 60, 10);
  }
  void move()
  {
    if (keyPressed== true && key == '4')
    {
      a = a - 10;
    }
    else if (keyPressed== true && key == '6')
    {
      a = a + 10;
    }
  }
}
class Ball  
{  
  int x, y;  
  boolean up, right;  
  Ball()  
  {  
    x = 0;  
    y = 0;  
    up= false;  
    right= true;
  }  
  void move()  
  {  
    if (right == true)  
    {  
      x= x + 4;
    }  
    else 
    {  
      x = x - 4;
    } 
    if (up == true)  
    { 
      y= y - 2;
    }  
    else 
    {  
      y = y + 2;
    }
  }  
  void bounce()  
  {  
    if (x < 0)  
    {  
      right = true;
    }  
    if (x > 400)  
    {  
      right = false;
    }  
    if (y < 0)  
    {  
      up = false;
    }  
    if (get(x,y+15) == (color(252,10,168)))  
    {  
      up = true;
    }
  }  
  void show()  
  {  
    fill(random(255),random(255),random(255));
    ellipse(x, y, 30, 30);
  }
}



