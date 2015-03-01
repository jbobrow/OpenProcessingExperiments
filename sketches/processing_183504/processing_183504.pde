
int x;
int y;
float outsideRadius = 150;
float insideRadius = 100;

void setup() {
  size(640, 640);
  background(204);
  x = width/2;
  y = height/2;
}

void draw() {
  background(#B4FFCB);
  strokeWeight(5.5);
  
  int numPoints = int(map(mouseX, 0, width, 6, 60));
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



