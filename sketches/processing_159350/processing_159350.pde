

float x = 1;
float y = 1;
float xspeed = 30;
float yspeed = 4;

void setup() {
  size(900,500);
  smooth();
  background(0);
}

void draw() {
  noStroke(255);
  fill(50, 100, 70);
  rect(500,500,width,height);
  
  x = x + xspeed;
  y = y + yspeed;

  // Check for bouncing
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  // Display at x,y location
  stroke(50, 50, 255);
  fill(255);
  ellipse(x,y,30,16);
}


