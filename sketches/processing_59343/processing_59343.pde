
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 45; // Head Radius
int neckHeight = 70; // Neck Height
int minNeckHeight = 16; // min Neck Height
int minBodyHeight = 90; //min BodyHeight
int bodyHeight = 160; // Body Height
float easing = 0.02; //easing
float neckEasing = 0.05; //neck easing
float bodyEasing = 0.5; //Body Easing
 
void setup() {
  size(760, 800);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}
 
void draw() {
  int targetX = mouseX;
  x += (targetX - x) * easing;
    if (mousePressed) {
      neckHeight += (minNeckHeight - neckHeight)* neckEasing ;
      bodyHeight += (minBodyHeight - bodyHeight)* bodyEasing;
    } else {
      neckHeight = 70;
      bodyHeight = 160;
    }
  float ny = y - bodyHeight - neckHeight - radius;
  background(204);
   
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


