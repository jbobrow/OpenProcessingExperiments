


float x = 100;
float y = 100;
float xspeed = 10;
float yspeed = 3.3;

void setup() {
  size(400,400);
  smooth();
  background(255);
}

void draw() {
  noStroke();
  fill(255,180, 390, 5);
  rect(0,0,width,height);
   noStroke();
  fill(160,180, 390, 5);
  rect(0,0,width,height);
  noStroke();
  fill(160,180, 390, 5);
  rect(0,0,width,height);
  
  // Add the current speed to the location.
  x = x + xspeed;
  y = y + yspeed;

  // Check for bouncing
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1.10;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1.01;
  }

  // Display at x,y location
  stroke(0);
  fill(15);
  ellipse(x,y,60,60);
    stroke(200);
  fill(160);
  ellipse(x,y,20,20);
}

                
                
