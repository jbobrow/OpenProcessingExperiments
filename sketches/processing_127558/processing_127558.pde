
// Francisca Jara
// 09/01/2014
// Project: Catching ball
int x = 50;        // variables
int y = 50;
 
int dx = 9;        // velocity (9,5)
int dy = 5;
 
void setup() {  //setup function called initially, only once
  size(500, 250);
  background(255);  //set background white
 
}
 
void draw() {  //draw function loops
   
  background(255);
   
  fill(random(255), random(255), random(255), random(255));
  ellipse(x,y,50,50);
  x = x + dx;
  y = y + dy;
   
   
  if (mousePressed){
      x = mouseX;
      y = mouseY;
  }
   
   
   
   
   
  if (x > 500) {        // X axis collision
      dx = -9;
  }
  else if (x < 0) {
      dx = 9;
  }
   
  if (y > 250)  {      // Y axis collision
      dy *= -1;        // the same as dy = dy*(-1)
  }
  else if (y < 0) {
      dy *= -1;
  }
}



