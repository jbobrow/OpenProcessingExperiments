
// Alex Nelson
//borrowed from the basic motion code

float x;
float y;
float speed;
float radius;

void setup(){
  size(400,400);
  x = 0;
  y = 0;
  speed = 1;
  radius = 50; 
}

void draw(){
  background(255,100,50);
 
 
//bouncing ball from left to right
  x = x + speed;
  fill(random(0,100));
  ellipse(x,random(height),radius,radius); 
  
//bouncing ball from top to bottom
  y = y + speed;
  fill (random(0,100));
  ellipse(random(width),y,radius,radius); 

}


