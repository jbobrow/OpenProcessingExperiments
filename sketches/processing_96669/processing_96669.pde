
float x = 180; // x-coordinate 
float y = 400; // y coordinate
float bodyHeight = 153; // body height 
float neckHeight = 56; // neck height 
float radius = 45; // head radius  
float angle = 0.0; // angle for motion 

void setup() {
  size(360, 480);
  smooth();
  ellipseMode(RADIUS);
  background(204);
}

void draw() {
  // change position by a small random amount
  x += random(-4, 4);
  y += random(-1, 1);
  
  // change the height of the neck 
  neckHeight = 80 + sin(angle) *30;
  angle += 0.05; 
  
  //adjust the height of the head
  float ny = y - bodyHeight - neckHeight - radius;
  
  // neck 
  stroke(250, 0, 0);
  line (x+2, y-bodyHeight, x+2, ny);
  line (x+12, y-bodyHeight, x+12, ny);
  line (x+22, y-bodyHeight, x+22, ny);
  // antennae
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);
  // body
  noStroke();
  fill(0, 255, 0);
  ellipse(x, y-33, 33, 33);
  fill(0, 0, 255);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);
  fill(50, 100, 150);
  rect(x-45, y-bodyHeight+17, 90, 6);
  // head 
  fill(75, 122, 234);
  ellipse(x+12, ny, radius, radius);
  fill(0);
  ellipse(x+24, ny-6, 14, 14);
  fill(255);
  ellipse(x+24, ny-6, 3, 3);
}


