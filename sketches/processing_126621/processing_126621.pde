
int x;
int y;
float outsideRadius = 150;
float insideRadius = 100;

void setup() {
  size(640, 360);
  background(0,255,175,200);
  x = width/2;
  y = height/2;
}

void draw() {
  background(0);
  
  int numPoints = int(map(mouseX, 0, width, 4, 45));
  float angle = 40;
  float angleStep = 300.0/numPoints;
  fill(random(255), random(255), random(255), 255); 
    
  beginShape(TRIANGLE_STRIP); 
  for (int i = 0; i <= numPoints; i++) {
    float px = x + cos(radians(angle)) * outsideRadius;
    float py = y + sin(radians(angle)) * outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + cos(radians(angle)) * insideRadius;
    vertex(px, py); 
    angle += angleStep;
  }
   
  endShape();
}


