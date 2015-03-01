
/**
 * Triangle Strip 
 * by Ira Greenberg. 
 * 
 * Generate a closed ring using the vertex() function and 
 * beginShape(TRIANGLE_STRIP) mode. The outsideRadius and insideRadius 
 * variables control ring's radii respectively.
 */

int x;
int y;
float outsideRadius = 150;
float insideRadius = 100;
float r, g, b; // color

void setup() {
  size(360, 360);
  background(204);
  x = width/2;
  y = height/2;
  frameRate(10);
}

void updateColor()
{
  r = (r + 51) % 255;
  g = (g + 31) % 255;
  b = (b + 71) % 255;
  fill(color(r, g, b));
}

void draw() {
  
  background(500);
  
  int numPoints = int(map(mouseY, 0, width, 30, 300));
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
    updateColor();
    vertex(px, py); 
    angle += angleStep;
  }
  endShape();
}

