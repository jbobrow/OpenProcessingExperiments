
// draw a star using rotated triangles 

void setup() {
  size(400, 400);
  noStroke();
  smooth(); 
}

void draw() {
  background(0);
  fill(255);
  
  // center the origin so that (0, 0) is now the middle of the sketch
  translate(width/2, height/2); 

  float angle = TWO_PI / 5; // TWO_PI is 360 degrees, but in radians
  float thickness = mouseX; 
  float radius = mouseY;
  for (int i=0; i < 5; i++) {
    rotate(angle);
    triangle(-thickness/2, 0, 0, radius, thickness/2, 0);
  } 
}

