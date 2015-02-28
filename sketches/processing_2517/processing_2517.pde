
class Obj 
{ 
  float y; 
  float x; 
  float xspeed = 1;
  float yspeed = 0;
  
  float xaccel = 0;
  float yaccel = 0.1; 
  float c; 
  Obj(float Xpos, float Ypos) 
  { 
    x = Xpos; 
    y = Ypos; 
    xspeed = 0; 
    yspeed = 0; 
  } 
  void display(float col) 
  { 
    c = col; 
    colorMode(HSB,100); 
    noStroke(); 
    fill(c,100,100,50); 
    rectMode(CENTER); 
    ellipse(x, y, 50,50); 
  } 
void update () {
   
   xspeed += xaccel;
   yspeed += yaccel;
   x += xspeed;
   y += yspeed;
   
   if (y > height) {
     yspeed = -yspeed;
   };
   

   if (x > width) {
     xspeed = -xspeed;
   };
   

   if (x < 0) {
     xspeed = -xspeed;
   };
   
  } 
  void gravity() 
  { 
     xspeed = xspeed + G; 
   } 
} 


