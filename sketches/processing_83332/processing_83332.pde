
Paddle eric;
Ball gretta;
void setup()
{
  size(300, 300);
  frameRate(100);
  eric = new Paddle();
  gretta= new Ball();
  
}
void draw()
{
  stroke(255);
  background(0);
  eric.move();
  eric.show();
  gretta.move();
  gretta.bounce();
  gretta.show();
}
class Ball
{
  int x;
  int y;
  boolean up, right,gameOver;
  Ball()
  {
    x=0;
    y=100;
  }

  void move()
  {
    if (right==true)
    {
      x++;
    }
    if (right==false)
    {
      x--;
    }
    if (up==true)
    {
      y++;
    }
    if (up==false)
    {
      y--;
    }
  }
  void bounce()
  {
    if (get(x-1,y) != color(0))
    {
      right = true;
    }
    if (get(x+1,y) != color(0))
    {
      right = false;
    }
    if (get(x,y-1) != color(0))
    {
      up=true;
    }
    if (get(x,y+1) != color(0))
    {
      up=false;
    }
    if (y >297)
    {
      gameOver = true;
      textAlign (CENTER);
      textSize(25);
      text("Game Over", 150,150);
      noLoop();
    }
  }
    
  void show()
  {
    ellipse(x, y, 10, 10);
  }
}
class Paddle
{
  int xm;
  Paddle()
  {
    int xm = 150;
  }
  void move()
 {
   if(keyPressed == true && key =='g')
   {
     xm++;
   }
   if(keyPressed== true && key=='f')
   {
     xm--;
   }
 }
   
 void show()
  {
    rect(xm, 280, 30, 10);
    rect(90,100,30,10);
    rect(200,100,30,10);
  }
}
