
//always name our classes with a capital letter!!!!

class Ant {
  
  float x;
  float y;
  float speed = 1;
  float antSize = 2;
 
 
 Ant(){
   
   
 };
 
 void walk(){
   //update the x and y
   x = x + random(-speed, speed);
   y = y + random(-speed,speed);
   
   //draw the ant
   fill(0,0,0,25);
   noStroke();
   ellipse(x,y,antSize,antSize);
   
 };
  
  
};

