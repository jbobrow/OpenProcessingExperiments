
float x = 0;
float y = 0;
float xspeed = 2.2;
float yspeed = 1.5;
float r = 32;

void setup() {
  size(200,200);
  smooth();
}
void draw() {
  background(138, 20, 30);
  x = x + xspeed;
  y = y + yspeed;

  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
    r = 64;
  }
  
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
    r = 64;
  }
  stroke(0);
  fill(175,95, 20);
  ellipse(x,y,r,r);
  
  r = constrain(r-2,32,64);
  
}
