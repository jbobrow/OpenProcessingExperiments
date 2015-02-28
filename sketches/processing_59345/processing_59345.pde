
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
float neckHeight = 70; // Neck Height
float bodyHeight = 160; // Body Height
float angle = 0.0; // Angle for motion
float radius = 45; // Head height

void setup() {
  size(709, 464);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
  background (204);
  
}
 
void draw() {
// Change position by a small random amount
x += random(-4, 4);
y += random(-1, 1);
// Change height of neck
neckHeight = 80 + sin(angle) * 30;
angle += 0.05;
// Adjust the height of the head
float ny = y - bodyHeight - neckHeight - radius;
   
// Neck
  stroke(102);
  line(x, y-bodyHeight, x, ny);
  line(x+2, y-bodyHeight, x+2, ny);
  line(x+4, y-bodyHeight, x+4, ny);
   
// Body
  noStroke();
  fill(102);
  ellipse(x, y-33, 33, 33);
  fill(0);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);
  fill(#810804);
  rect(x-65, y-bodyHeight, 20, bodyHeight-60);
  rect(x+45, y-bodyHeight, 20, bodyHeight-60);
  
   
// Head
  fill(0);
//  ellipse(x+12, ny, radius, radius);
  fill(255);
  ellipse(x-8, ny-6, 14, 14);
  fill(0);
  ellipse(x-8, ny-6, 3, 3);
  
  fill(255);
  ellipse(x+12, ny-6, 14, 14);
  fill(0);
  ellipse(x+12, ny-6, 3, 3);
}


