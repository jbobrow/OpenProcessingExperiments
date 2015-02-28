
int y = 100;
int speed = 5;
 
void setup() {
  size(300,300);
  smooth();
}
 
void draw() {
  background(0);
 
  // y location.
  y = y + speed;
 
   
  if ((y > 300) || (y < 5)) {
    // multiply speed by -1 to turn it around.
    speed = speed* - 1;
  }
 
  // Display circle at x location
  noStroke();
  fill(187,110,116);
  ellipse(150,y,32,32);
  
   noStroke();
  fill(179,73,56);
  ellipse(y,150,50,50);
   
}


