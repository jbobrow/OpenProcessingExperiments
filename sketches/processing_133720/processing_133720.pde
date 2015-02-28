
class Asteroid
{
  float x = 100;
  float y = 100;
  float radius = 10 ; 
  float fallspeed = random( 1, 4);
}

Asteroid[] asteroids = new Asteroid[ 13 ]; 



//player cursor
float playerx = 0;
float playerspeed = 2;
float left = 0;
float right =0;



void setup()

{
  size (500,600);

  
   
   for (int i = 0; i < asteroids.length; i = i += 1)
   {
      asteroids[i] = new Asteroid (); 
      asteroids[i]. x=  random ( width - 10);
   }
   
   
  
   
}

void draw()

{
  
  background (0);
  
  for (int i = 0; i < asteroids.length; i = i += 1)
      {  
    asteroids[i] . y +=  asteroids[i].fallspeed;       
    
   // if (rectRectIntersect( player.x, player.y, player.x + player.w, player.y + player.h, player.
                 // asteroids [i].x, asteroids[i].y, asteroids[i].x + asteroid [i].radius,
    
    
    ellipse ( asteroids [i].x, asteroids[i].y, asteroids[i].radius, asteroids[i].radius);
      }
      
      
      
      
      
      
   playerx +=( right - left) * playerspeed;
   rect( playerx, 350, 20,20);
   
   
   
   
   
   
   
   
   
}
  
  
  
  
  
  
  
  
  
  
  
  
 //so it stops moving when released 
  void keyReleased()
  {
    if (key == CODED)
     {
       if (keyCode == LEFT)
         {
           left =0;
         }
        if (keyCode == RIGHT)
          {
            right =0;
          }
     }
  }
  
  
  
  
  
//so it moves when pressed
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
  }
  
  
  
 // boolean rectRectIntersect(float left, float top, float right, float bottom,
                         // float otherLeft, float otherTop, float otherRight, float otherBottom) {
  //return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  
}
      
      



