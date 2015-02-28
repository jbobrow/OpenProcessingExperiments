
void setup() {
  size(100, 100, P3D);
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  rotateY(frameCount*PI/120);
  translate(50, 0);
  noStroke();
  sphere(10); //半径30pxの球
}

