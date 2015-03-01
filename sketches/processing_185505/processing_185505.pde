
float x = 100;
float y = 100;
float w = 30;
float h = 30;
 
float xspeed = 5;
float yspeed = 5;
 
void setup() {
  size(400,200);
  frameRate(20);
}

void draw() {
   
  background (255);
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width-(w/2)) || (x < w/2)) {
    xspeed = xspeed * -1;
    w-=5;
    h-=5;
  }
   
   if ((y > height-(h/2-7)) || (y < h/2+17)) {
    yspeed = yspeed * -1;
    w-=5;
    h-=5;
  }
  fill (255,0,0);
  ellipse(x,y-h/2,w,h);
  }
   
  
  



