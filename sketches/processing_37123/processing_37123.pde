
float x = 60;  
float y = 479;         
int radius = 95;     
int bodyHeight = 160; 
int neckHeight = 70;   

float easing = 0.04;

void setup() {
  size(1000, 480);
  smooth();
  strokeWeight(10);
 
  ellipseMode(RADIUS);
}
void draw() {
  
  int targetX = mouseX;
  x += (targetX - x) * easing;
    
  if (mousePressed) {
    neckHeight = 20;
    bodyHeight = 40; 
  } else {
    neckHeight = 100;
    bodyHeight = 150; 
  }
  
  float ny = y - bodyHeight - neckHeight - radius;
  background(114,121,56);
  // Neck
  stroke(221,235,100);
  line(x+12, y-bodyHeight, x+12, ny); 
  
  // Antennae
  line(x+54, ny, x-150, ny-53);
  line(x+15, ny, x+142, ny-99);
  line(x+12, ny, x+90, ny+15);
  // Body
  noStroke();
  fill(127,72,119);
  ellipse(x, y-97, 97, 97);
  fill(0);
  rect(x-100, y-bodyHeight, 200, bodyHeight-53);
  // Head
  fill(0);
  ellipse(x+10, ny, radius, radius); 
  fill(233,128,237);
  ellipse(x+24, ny-6, 14, 14);
  fill(176,106,139);
  ellipse(x+24, ny-6, 3, 3);
}

