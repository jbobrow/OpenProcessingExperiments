
float ball_x;
float ball_y;
float ball_dir = 3;
float ball_size = 25;
float dy = 0;
float dx = 0;
int block_width = 300;
int block_height = 50;
SpriteObject space;
SpriteObject ship;
SpriteObject win;
SpriteObject lose;
SpriteObject target;
float up = 0;
float down = 0;
float left = 0;
float right = 0;
float speed = 1.85;
float timer = 0;
int winGame = 0;
int loseGame = 0;

void setup()
{

  size(500, 500);
  space = new SpriteObject("space.jpg");
  space.x = width/2;
  space.y = height/2;
  ship = new SpriteObject("ship.png");
  ship.x = 250;
  ship.y = 780;
  win = new SpriteObject("win.jpg");
  win.x = width/2;
  win.y = height/2;
  lose = new SpriteObject("lose.jpg");
  lose.x = width/2;
  lose.y = height/2;
  target = new SpriteObject("target.png");
  target.x = block_width;
  target.y = block_height;
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
  smooth();
  ball_y = height/2;
  ball_x = width/2;

}



void draw() 

{
  space.render();
  if(winGame == 1)
  {
    win.render();
    text("you survived! welcome Home.",250,250);
  }
  if(loseGame == 1)
  {
    fill(0);
    lose.render();
    text("all is lost...",250,250);
    
  }
  println(loseGame); 
  textSize(20);
  text("Avoid All Asteroids",30,50);
  //text("Get 
  target.render();
  timer += 0.0167;
  
  //ship.render();
  //ship.update();

  ball_x += ball_dir * 1.0;

  ball_y += dy;
  ship.x += (right - left) * speed;
  ship.render();
  ship.y += (down - up) * speed;
  
  if(ship.x > 500)
  {
    ship.x =500;
  }
  if(ship.y > 500)
  {
    ship.y = 500;
  }
  if(ship.x < 0)
  {
    ship.x =0;
  }
  if(ship.y < 0)
  {
    ship.y = 0;
  }
  
  //ship.x -= left;
  //ship.x += right;

  if(ball_x > width+ball_size)
  {

    ball_x = -width/2 - ball_size;

    ball_y = random(0, height);

    dy = 0;

  }

  

  

  if(ball_x < ball_size || ball_x + ball_size > width)
  {

    ball_dir *= -1;

  }

  if(ball_y > height-ball_size)
  {

    dy = dy * -1;

  }

  if(ball_y < ball_size)
  {

    dy = dy * -1;

  }
  

  if(ship.y > 50 - block_height/2 - ball_size && ship.y < 50 + block_height/2 + ball_size 
  && ship.x > block_width - block_height/2 - ball_size && ship.x < block_width + block_height/2 + ball_size)
     {
       winGame = 1; 
     } 
     if(ship.y > ball_y - 32 - ball_size && ship.y < ball_y + 32 + ball_size 
  && ship.x > ball_x - 32 - ball_size && ship.x < ball_x + 32 + ball_size)
     {
       loseGame = 1;
     } 

  fill(255);

  ellipse(ball_x-20, ball_y-150, ball_size, ball_size);
  ellipse(ball_x, ball_y + 50, ball_size, ball_size);
  ellipse(ball_x+125, ball_y,ball_size,ball_size);
  ellipse(ball_x+40, ball_y-100, ball_size, ball_size);
  ellipse(ball_x+60, ball_y-300, ball_size, ball_size);
  ellipse(ball_x+75, ball_y + 50, ball_size, ball_size);
  ellipse(ball_x-125, ball_y+300,ball_size,ball_size);
  ellipse(ball_x+80, ball_y-65, ball_size, ball_size);
  
  
  //rect(block_width,block_height,50,50);
  

  

  

}

void mousePressed()
{
  ball_x = mouseX;
  ball_y = mouseY;
  ellipse(mouseX,mouseY,ball_size,ball_size);
}
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
    if (keyCode == UP)
    {
      up = 0;
    }
    if (keyCode == DOWN)
    {
      down = 0;
    }
  }
}
  
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
    if (keyCode == UP)
    {
      up = 1;
    }
    if (keyCode == DOWN)
    {
      down = 1;
    }
  }
}


class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
    
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
   
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - ( this.w * 0.5 * this.s);
    float right = this.x + ( this.w * 0.5 * this.s);
    float top = this.y - ( this.h * 0.5 * this.s);
    float bottom = this.y + ( this.h * 0.5 * this.s);
     
    float otherLeft = other.x - ( other.w * 0.5 * other.s);
    float otherRight = other.x + ( other.w * 0.5 * other.s);
    float otherTop = other.y - ( other.h * 0.5 * other.s);
    float otherBottom = other.y + ( other.h * 0.5 * other.s);
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
   
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      //this.speed += 2;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      //this.speed -= 2;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      //this.s = 0.5;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      //this.s = 2;
    }
      
    this.y += directionY * speed * random(0.1, 5);
    this.x += directionX * speed * random(0, 5);
     
      
  }
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
      
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



