
Wall material;
Ball[] balls = new Ball[10];//There's a total of 10 balls
 
void setup()
{
  size(500,500);//size of canvas
  background(195);
  smooth();
  material = new Wall(100, mouseY, 10, 45);
  for( int j = 0; j < balls.length; j++)
  {
    float x = random(width);
    float y = random(height);
    int d = 15;
    balls[j] = new Ball(x,y,d);
  }
}
 
void draw()
{
  background(0);
  fill(#D807F0);
  material.display();
  for (int j = 0; j < balls.length; j++)
  {
    balls[j].move();
    balls[j].display();
  }
}
    
 
class Ball//diffrent variable
{
  float diameter;
  float x;
  float y;
  float speed;
  Ball(float TempX, float TempY, float TempD)
  {
    x = TempX;
    y = TempY;
    diameter = TempD;
    speed = 5;
  }
  void display()
  {
    stroke(0);
    ellipse(x,y,diameter,diameter);
    fill(#FF0D39);
  }
  void move()
  {
    x += speed;
     
    if (x > width || x < 0)
    {
      speed *= -1;
    }
    if(x < material.x && x + diameter/2 > material.x && y + diameter/2 > mouseY && y - diameter/2 < mouseY + material.wallheight)
    {
     speed = -abs(speed);
    }
    if(x > material.x && (x - diameter/2) < (material.x + material.wallwidth) && y + diameter/2 > mouseY && y - diameter/2 < mouseY + material.wallheight)
    {
      speed = abs(speed);
    }
  }
}
 
class Wall//different variable
{
  float wallheight;
  float wallwidth;
  float x;
  float y;
  Wall(float wX, float wY , float wW, float wH)
  {
    x = wX;
    y = wY;
    wallwidth = wW;
    wallheight = wH;
  }
 void display()
 {
   stroke(0);
   rect(x, mouseY, wallwidth, wallheight);
   fill(255);
 }
}

