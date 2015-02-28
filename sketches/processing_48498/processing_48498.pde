
float x = 100;
float y = 100;
float xspeed = 25;
float yspeed = 10;

void setup() 
{
  size(500,500);
  smooth();
  background(0,243,0,7
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  );
}

void draw() {
  noStroke();
  fill(100,255,100,5);
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
  fill(random(0),random (255),random(0));
  ellipse(x,y,16,16);
 
}








