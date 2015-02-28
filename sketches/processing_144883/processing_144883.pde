
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Joo Yong Gill
// ID: 201420108
 
int x = 0;
int y = 0;
int xspeed = 0.00009;
int yspeed = 9;
 
void setup() {
 
  size (600, 600);
  smooth();
 
  
}
 
void draw() {
 
  x = x + xspeed;
  y = y + yspeed;
   
  if ((x > width) || (x < 8)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 8)) {
    yspeed = yspeed * -1;
  }
  pushMatrix();
  stroke(0);
  strokeWeight(0.5);
  popMatrix();
   
  fill(255);
  triangle(x, y, width-x, width+x, height-x, x);
   
  strokeWeight(3);
  fill(255, 228, 0);
  triangle(y, x, width-y, width+y, y, y);
 
  strokeWeight(6);
  fill(255, 0, 0);
  triangle(y, x, width+x, width+x, x, x);
   
  strokeWeight(1);
  fill(255, 187, 0);
  quad(x, y, width/2-x, 0, width/2, height/2, width/4, width/2);
   
  strokeWeight(2);
  stroke(0);
  fill(0, 84, 255);
  quad(y, x, width/2-x, 0, width/2, height/3, width/2, height/2);
 
  strokeWeight(3);
  stroke(0);
  fill(171, 242, 0);
  quad(x, y, 3, width/2-x, height/2, width/3, height/2, width/2);
}
 
void keyPressed() {
  background(random(255), random(255), random(255), random(255));
}

