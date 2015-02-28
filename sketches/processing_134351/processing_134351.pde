
/**
 * Star
 * 
 * The star() function created for this example is capable of drawing a
 * wide range of different forms. Try placing different numbers into the 
 * star() function calls within draw() to explore. 
 */

void setup() {
  size(1000, 600);
}

void draw() {
  background(233,22,44);
  
  noStroke();
  pushMatrix();
 for ( int i =0; i<25; i++) {
  
  translate(width/2+100, height*0.5);
  rotate(frameCount / 100.0);
  
  for ( int j =0; j<100; j++) {
  star(30, 0, 5, mouseX, 3); 
  }}
  popMatrix();
 
}


void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
