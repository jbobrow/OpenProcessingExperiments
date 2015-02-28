

float x = 0;
float y = 0;
float xspeed = 2;
float yspeed = 1;


void setup() {
  size(400,400);
}

void draw() {
  background(123,23,245);
  x = x + xspeed;
  y = y + yspeed;
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;

  }
  
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;

  }


  fill(23, 34, 134);
  ellipse(x,y,60,60);
  

  
}


