
float x;
float y;
float xspeed;
float yspeed;

void setup(){
  size(600, 600);
  smooth();  
  x = 50.0;
  y = 50.0;
  xspeed = 3.0;
  yspeed = 4.2;
  noStroke();
  smooth();
  
}

void draw()
{
   //background(0);
   
   fill(0, 10);
   rect(0,0,width,height); 
   
   x = x + xspeed;
   y = y + yspeed;
   
   if(  (x >= width-50)  ||  (x <= 50) )
   {
     xspeed = xspeed * -1;  
   }
   if(  (y >= height-50)  ||  (y <= 50) )
   {
     yspeed = yspeed * -1;  
   }
   
   fill(100);
   ellipse(x, y, 100,100);
  
}

