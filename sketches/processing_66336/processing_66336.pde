
float x =32, y =128;
float dx,dy;
float gravity = 5;
int ballsize =30;
 
 void setup()
 {
   size(300, 300, P3D);
   fill(255,75,146); noStroke();
   frameRate(20);
   background(255);
  
   dx=5;
   dy=10;
  
 }
 
 void draw()
 {
   background(0);
   translate(x,y);
   ellipse(0,0, ballsize,ballsize);
  
   if(x>width-ballsize/2 || x<ballsize/2)
     dx = -dx;
   if (y>height - ballsize/2)
       dy = -dy;
   else
     dy += gravity;
   x += dx;
   y += dy;
 }  

