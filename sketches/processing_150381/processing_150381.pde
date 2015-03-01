
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;

void setup() {
  size(500,500);
  smooth();
  background(255);
}

void draw() {
  noStroke();
  fill(255,10);
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
  stroke(0);
  fill(175, 0, 0);
  ellipse(x,y,16,16);
  fill(0, 0, 255);
  stroke(255);
rect(100, 100, 50, 150);
rect(350, 100, 50, 150);
fill(413, 420, 69);
rect(150, 400, 195, 50);

}
