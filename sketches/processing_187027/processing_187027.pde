
float x = 0;
float y = 0;
float xspeed = 4.4;
float yspeed = 3;
float r = 32;


void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(57,255,21);

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
  stroke(1);
  fill(50);
  ellipse(x,y,r,r);
  
  r = constrain(r-2,32,64);
  
}
