
class asteroid
{
float x = 100;
float y = 100;
float radius = 20;
float speed = random(5);
}


class Ship
{
  float x = random(900);
  float y = random(900);
  float w = 50;
  float h = 25;
  float speed = 1.0;
}


boolean isRightDown = false;
boolean isLeftDown = false;

float r = 0.0;
//Asteroid astroid1;

asteroid[] asteroids = new asteroid[15];
Ship player = new Ship();


void setup()
{
 size(900,900); 
  for (int i = 0;  i < asteroids.length; i += 1)
  {
    //    , asteroids[i].speed()
    asteroids[i] = new asteroid();
    asteroids[i].x = random(900);
  }
}

void draw()
{
  background(0,0,0);
  colorMode(HSB);
  fill(random(255),0,0,0);
  strokeWeight(3);
  stroke(random(255),random(255),random(255));
 for (int i = 0; i < asteroids.length; i += 1)
  {
     asteroids[i].y += asteroids[i].speed;
     if  (asteroids[i].speed <= 2)
    {
    asteroids[i].speed = 3.5; 
    }
    ellipse(asteroids[i].x,asteroids[i].y, asteroids[i].radius, asteroids[i].radius);
  }
  
  rotate(0);
  fill(random(255),random(255),random(255));
 // translate(width/2, 750);
  rect(player.x, 800, 150,50);
  
// didn't finish this line
//  if(rectRectIntersect(player.x,player.y,player.x+player.w
}

void keyPressed()

{
  
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      player.x -= 10;
      isLeftDown = false;
    }
    
    
    if(keyCode == RIGHT)
    {
     player.x += 10; 
     isRightDown = false;
    }
    
    
  }
  
}

//boolean rectRectIntersect(float left, float top, float bottom, float right)



