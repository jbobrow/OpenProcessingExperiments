
float x1, x2, x3, y1, y2, y3;

void setup() {
  x1 = 320;
  x2 = 320;
  x3 = 320;
  y1 = 240;
  y2 = 240;
  y3 = 240;
  frameRate(30);
  size (640, 480);
  background(0);
  smooth();
  noFill();
}
void draw() {
  stroke(random(255), random(255), random(255));
  x1 = mouseX;
  x2 = pmouseX+(random(-30, 30));
  x3 = pmouseX+(random(-40, 40));
  y1 = mouseY;
  y2 = pmouseY+(random(-30, 30));
  y3 = pmouseY+(random(-40, 40));
  triangle(x1, y1, x2, y2, x3, y3);

}

void mousePressed(){
  noLoop();
  background(0);
}
void mouseMoved(){
  
  loop();
  }



