

float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 2;

void setup() {
  size(400,400);
  smooth();
  background(255);
}

void draw() {
  noStroke();
  fill(205,10);
  rect(0,0,width,height);
  
  // Add the current speed to the location.
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
  stroke(240);
  fill(130,10);
  rect(x,y,190,16);
   ellipse(x,y,100,100); ellipse(x,10,200,100); ellipse(10,y,100,50);
   ellipse(20,y,100,100);
}



