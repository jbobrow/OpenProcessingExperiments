

class Asteroid
{
  float x= random(50,450);
  float y = 100;
  float radius= 20;
  float speed= random(1,5);
}

class Ship
{
  float x=250;
  float y=600;
  float w=50;
  float h=25;
  float speed=5;
}

boolean isleftDown= false;
boolean isRightDown = false;
Asteroid[] asteroids = new Asteroid[8];
Ship player = new Ship();
void setup()
{

 size(500,700);
 
 for(int  i = 0; i < asteroids.length; i+=1)
 {
 asteroids[i] = new Asteroid();
 
 }

 }
void draw()
{
  background(0);
  
  rect(player.x,player.y,player.w,player.h);
  fill(255,0,0);
  for(int i =0; i <asteroids.length; i += 1)
  {
  
  asteroids[i].y+=asteroids[i].speed;
  ellipse(asteroids[i].x,asteroids[i].y,asteroids[i].radius,asteroids[i].radius);
  }
  fill(0,0,255);
  
}
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      player.x -=10;
    }
    if (keyCode == RIGHT)
    {
      player.x +=10;
    }
  }
}
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      player.x -= 10;
    }
    if (keyCode == RIGHT)
    {
      player.x+= 10;
    }
  }
}




