

float x = random (0,350);
float y = random (0,350);
float xspeed = 4;
float yspeed = 1.3;
float r = 32;

void setup() {
  size(700,700);
  smooth();
  background(255);
}

void draw() {
  

  x = x + xspeed;
  y = y + yspeed;

  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
    x= x-2;
  }

  if ((y > height) || (y < 0)) {   
    yspeed = yspeed * -1;
  }

  stroke(y/3,100,x/3);
  fill(20,x/3,y/3);
  ellipse(x,y,r,r);  
  r = constrain(r+2,32,80);
  if (r >= 80) {
     r=32;
  }
}

