
int x;
int y;
float outsideRadius = 150;
float insideRadius = 100;


void setup() {
  size(400, 400);
  noLoop();  // draw() will not loop
  background(204);
  x = width/2;
  y = height/2;
}

void draw() {
  background(204);
  int numPoints = int(map(random(50), 0, width, 6, 60));
  float angle = 0;
  float angleStep = 180.0/numPoints;
    
  beginShape(TRIANGLE_STRIP); 
  for (int i = 0; i <= numPoints; i++) {
    float px = x + cos(radians(angle)) * outsideRadius;
    float py = y + sin(radians(angle)) * outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    vertex(px, py); 
    angle += angleStep;
  }
  endShape();
}

void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}
