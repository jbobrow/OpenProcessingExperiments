
/* 
Loom2  
Nevena Ivanova, Sept 2011
*/

float x = random(50);
float y = random(100);
float speedX = random(5.5);
float speedY = random(10);
float r = 5;
 
void setup() {
  size(400, 400);
  frameRate(100);
  background(0,77);
}
 
void draw() {
  
  fill(random(10,255));
  noStroke();
  smooth(); 
  ellipse(x, y, random(2,r), random(2,r));
 
   x = x + speedX;
   y = y + speedY;
  
   if(x >= width-r*2) {
      speedX = -speedX;
   }    
  else if(x <= 0) {
    speedX = -speedX;
  }
    if(y >= height-r*2) {
      speedY = -speedY;
    } 
    else if(y<= 0) {
      speedY = -speedY;
    }
}

