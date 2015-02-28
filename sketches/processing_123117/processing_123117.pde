
Ball one;
Paddle two;
Brick three;
Brick four;
Brick five;
Brick six;
Brick seven;
Brick eight;
Brick nine;
Brick ten;
Brick eleven;
Brick twelve;
Brick thirteen;
Brick fourteen;
float vic = 12;
PImage paddleImg;

void setup()
{
  size(400, 700); 
  frameRate(150);
  paddleImg = loadImage("moe3.png");
  one = new Ball();  
  two = new Paddle(); 
  three = new Brick();
  four = new Brick();
  four.brickX = 70 + 5;
  five = new Brick();
  five.brickX = 130 + 5;
  six = new Brick();
  six.brickX = 190 + 5;
  seven = new Brick();
  seven.brickX = 250 + 5;
  eight = new Brick();
  eight.brickX = 310 + 5;
  nine = new Brick();
  nine.brickY = 40;
  ten = new Brick();
  ten.brickX = 70 + 5;
  ten.brickY = 40;
  eleven = new Brick();
  eleven.brickX = 130 + 5;
  eleven.brickY = 40;
  twelve = new Brick();
  twelve.brickX = 190 + 5;
  twelve.brickY = 40;
  thirteen = new Brick();
  thirteen.brickX = 250 + 5;
  thirteen.brickY = 40;
  fourteen = new Brick();
  fourteen.brickX = 310 + 5;
  fourteen.brickY = 40;
  
}
void draw()
{
  background(0);
  
  two.paddle(); 
  three.brick();
  four.brick();
  five.brick();
  six.brick();
  seven.brick();
  eight.brick();
  nine.brick();
  ten.brick();
  eleven.brick();
  twelve.brick();
  thirteen.brick();
  fourteen.brick();
  one.move();
  one.bounce(); 
  one.show();
  
  

}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = int(random(400)); 
    y = int(random(100, 200)); 
    up = false;
    right = false;
  }
  void move()
  {
    if (up == true)
    {
      y--;
    }
    else
    {
      y++;
    }
    if (right == true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
  void bounce()
  {
    if (x <= 0)
    {
      right = true;
    }
    if (x >= 400)
    {
      right = false;
      up = !up;
    }
    if (y <= 0)
    {
      up = false;
    }
    if (get(x, y) != color(0))
    {
      up = !up;
      if (x < mouseX +(75/2))
      {
        right = false;
      }
      if (x > mouseX + (75/2) && x < mouseX +75)
      {
        right = true;
      }
    }
    if (y >= 400 || x >=600)
    {
      up = false;
      fill(0);
      rect(0, 0, 400, 400);
      textAlign(CENTER);
      textSize(48);
      fill(255, 0, 0);
      text("Game Over", 200, 200); 
    }

    
  }
  void show()
  {
    fill(255, 0, 0); 
    ellipse(x, y, 30, 30); 
  }
}
class Paddle
{
  Paddle()
  {
  }
  void paddle()
  {
    fill (0, 0, 0); 
    rect(mouseX, 350, 75, 10); 
    image(paddleImg, mouseX-100, 350);
  }
}
class Brick
{
  int brickX, brickY, r, g, b;
  Brick()
  {
    brickX = 15;
    brickY = 10;
    r = int(random(10, 255)); 
    g = int(random(10, 255)); 
    b = int(random(10, 255)); 
  }
  void brick()
  { 
    
    fill(r, g, b);
    rect(brickX, brickY, 50, 20);
    if (one.y >= brickY && one.y <= brickY + 20 && one.x >= brickX && one.x <= brickX + 50)
    {
      
      r = 0; 
      g = 0;
      b = 0;
      
      
    
    }
    
  }
}


