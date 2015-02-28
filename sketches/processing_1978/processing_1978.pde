
import java.util.*;

ArrayList thingies = new ArrayList(); 
int width = 600; 
int height = 500; 

void setup() 
{ 
 size(width, height); 
 colorMode(HSB, 100); 
 frameRate(35); 
} 

public class Thingy 
{ 
 int col; 
 float x; 
 float y; 

 float xspeed; 
 float yspeed; 
 float mag = 3; 
 boolean moving = true; 
 boolean explodeTime = true; 
 boolean baby = false;

 public Thingy ( float x, float y, int col) 
 { 
   this.col = col; 
   this.x = x; 
   this.y = y; 
   float dir = random( 0,(float)Math.PI*2); 
   float magnitude = 10; 
   xspeed = 0; 
   yspeed = sin(0); 
 } 

 public Thingy ( float x, float y, int col, boolean baby) 
 { 
   this.col = col; 
   this.x = x; 
   this.y = y; 
   float dir = random( 0,(float)Math.PI*2); 
   float magnitude = random(0, mag); 
   xspeed = cos(dir) * magnitude; 
   yspeed = sin(dir) * magnitude; 
   this.baby = baby;
 } 

 public void explode() 
 { 
   for( int i = 0; i < 50; i++) 
   { 
     thingies.add( new Thingy(x,y,col, true)); 
      println( "ex" );

     float magnitude = 5; 
     float dir = random( 0, (float)Math.PI * 2 ); 
     float mag = random( 0, magnitude ); 
     xspeed = cos(dir) * mag; 
     yspeed = sin(dir) * mag; 
   } 
 } 

 public void updateframe() 
 { 
   yspeed += .08; 
   y+= yspeed; 
   x+= xspeed;
   
  if(!baby)
  {
   stroke(col, 140, 120); 
   ellipse(x, y, 8,8); 
  }
  
  else
  {
    stroke(col, 120, 120);
    ellipse(x,y,3,3);
  }

   if( y > height/2 && explodeTime && !baby ) 
   { 
     explode();
     explodeTime = false; 
     baby = true;
   } 

   if(y > height) 
   { 
     moving = false; 
   } 

 } 
} 

int time = 0; 
void draw() 
{ 
 time++; 
 if( time % 10 == 0) 
 { 
   float x = random(0, width); 
   float y = 0; 
   int col = (int)(Math.random()*100); 

   thingies.add( new Thingy(x, y, col)); 
 } 



 background( 0 ); 
 for (int i = 0; i < thingies.size(); i++) 
 { 
   Thingy th = (Thingy)thingies.get(i); 
   th.updateframe(); 
 } 

 for (int i = 0; i < thingies.size(); i++) 
 { 
   Thingy th = (Thingy)thingies.get(i); 
   if( !th.moving) 
   { 
     thingies.remove( th ); 
   } 
 } 



}

