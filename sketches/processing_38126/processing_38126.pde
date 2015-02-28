
/* 
Loom1  
Nevena Ivanova, Sept 2011
*/

float x = 30;
float y = 200;
float speedX = 5.5;
float speedY = 5;
float r = 20;
 
void setup() {
  size(400, 400);
  frameRate(60);
  background(0,77);
}
 
void draw() {
  
  fill(random(255),77);
  noStroke();
  smooth(); 
  ellipse(x, y, random(r), random(r));
 
  x = x + speedX;
  y = y + speedY;
   
    
   if(x >= width-r/2) {
      speedX = -speedX;
   } else if(x <= 0) {
     speedX = -speedX;
   } else if(x == r/2) {
      speedX = -speedX;
   }
   
    if(y >=height-r/2) {
      speedY = -speedY;
   } else if(y <= 0) {
     speedY = -speedY;
   } else if(y == r/2) {
      speedY = -speedY;
   }
}

