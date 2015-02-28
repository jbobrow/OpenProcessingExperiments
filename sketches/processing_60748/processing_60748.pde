
// bouncing ball no vectors
// processing.org/learning/pvector/
// 08.05.2012 09:00
 
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;
 
void setup() {
  size (200,200);
  smooth();
  background(255); 
}
   
void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
   
  // current speed
  x = x + xspeed;
  y = y + yspeed;
   
  // bouncing
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
   
  // dispay at x,y position
  stroke (0);
  fill (0);
  ellipse(x,y,16,16);
}
