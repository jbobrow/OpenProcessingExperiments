
float x = 60;          // X-coordinate
float y = 440;         // Y-coordinate
int radius = 45;       // Head Radius
int bodyHeight = 160;  // Body Height
int neckHeight = 70;   // Neck Height
 
float easing = 0.02;
 
void setup() {
  size(480, 440);
  smooth();
  strokeWeight(3);
  ellipseMode(RADIUS);
}
 
void draw() {
   
  int targetX = mouseX;
  x += (targetX - x) * easing;
     
  if (mousePressed) {
    neckHeight = 24;
    bodyHeight = 240;
  } else {
    neckHeight = 70;
    bodyHeight = 160;
  }
   
  float ny = y - bodyHeight - neckHeight - radius;
  background(#00CC99);

   
  // Neck
  stroke(#ccff99);                 // Bright yellow
  line(x+2, y-bodyHeight, x+2, ny);
  line(x+12, y-bodyHeight, x+12, ny);
  line(x+22, y-bodyHeight, x+22, ny);
 
  // Antennae
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);

  // Body
  noStroke();
  fill(102);
  ellipse(x, y-33, 33, 33);
  fill(120);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);
  fill(52);
  rect(x-45, y-bodyHeight+17, 90, 6);
   
  // Head
  fill(240);
  ellipse(x+12, ny, radius, radius);
  fill(120);
  ellipse(x+24, ny-6, 14, 14);
  fill(23);
  ellipse(x+24, ny-6, 3, 3);

 
}
