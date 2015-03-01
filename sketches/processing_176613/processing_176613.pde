
Wall material;//where the ball bounces back from the meeting point.
Ball[] balls = new Ball[10];//There's a total of 10 balls
 
void setup()
{
  size(500,500);//size of canvas
  background(195);
  smooth();
  material = new Wall(100, mouseY, 10, 45);
  for( int j = 0; j < balls.length; j++)
  {
    float x = random(width);//random number
    float y = random(height);//random number
    int d = 15;
    balls[j] = new Ball(x,y,d);//different balls
  }
}
 
void draw()
{
  background(0);
  fill(#D807F0);
  material.display();
  for (int j = 0; j < balls.length; j++)//iteration which constructs repetitive forms
  {
    balls[j].move();//the movemement of the ball
    balls[j].display();//the way it is designed, the structure this sketched has.
  }
}
    
 
class Ball//diffrent variable,Keyword used to indicate the declaration of a class. A class is a composite of fields (data) and methods (functions that are a part of the class)
{
  float diameter;//variable 
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
      speed *= -1;//speed of the ball
    }
    if(x < material.x && x + diameter/2 > material.x && y + diameter/2 > mouseY && y - diameter/2 < mouseY + material.wallheight)
    {
     speed = -abs(speed);
    }
    if(x > material.x && (x - diameter/2) < (material.x + material.wallwidth) && y + diameter/2 > mouseY && y - diameter/2 < mouseY + material.wallheight)
    {
      speed = abs(speed);//Calculates the absolute value (magnitude) of a number. The absolute value of a number is always positive.
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
    wallwidth = wW;//the width of the ball
    wallheight = wH;//the height of the ball
  }
 void display()
 {
   stroke(0);
   rect(x, mouseY, wallwidth, wallheight);
   fill(255);
 }
}

