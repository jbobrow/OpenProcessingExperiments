

float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;
 
 
void setup (){
   size(800, 500);
  
}
void draw(){
  background(20);
    rect( 20,mouseY, 20, 100);
  rect( 760,mouseX, 20, 100);
  
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
  fill(175);
  ellipse(x,y,16,16);
}



