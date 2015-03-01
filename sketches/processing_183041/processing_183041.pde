
float x = 100;
float y = 100;
float w = 60;
float h = 60;

float xspeed = 30;
float yspeed = 20;

void setup() {
  size(400,400);
}

void draw() {
  
  background (#264873);
  
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  
   if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
 
 noStroke();
 fill (#EAB725);
 ellipse(x,y-h/2,w,h);
 
 fill (#9A2418);
 ellipse(200,200,100,100);
  
 
 
}


