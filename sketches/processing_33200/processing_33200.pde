
float x = 0;
float y = 0;
float xspeed = 3;
float yspeed = 4.4;


void setup() {
  size(400,400);
  smooth();
  background(144,0,195);
  frameRate(50);
}


void draw() {
  background(144,0,195);
  noStroke();
  fill(144);

  // Add the current speed to the x location.
  x = x + xspeed;
  y = y + yspeed;

  // Check for bouncing
  if ((x > width) || (x < 0)) { 
    xspeed = xspeed * -1;
   
  }
  if ((y > height) || (y < 0)) {

    // If the object reaches either edge, multiply speed by -1 to turn it around.
    yspeed = yspeed * -1;
    
  }

  // Display circle at x location
  stroke(0);
  fill(144);
  ellipse(x,y,64,64);

  
  
}

