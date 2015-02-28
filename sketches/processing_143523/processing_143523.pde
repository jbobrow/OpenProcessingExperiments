
void setup() {
  size(500, 500, P3D);
}

void draw() {
  background(255);
  float sideLength = width*0.2;
  translate(width/2, height/2);
  rotateX((mouseX-width/2)*0.01);
  rotateY((mouseY-height/2)*0.01);
  for (int i=0; i<3000; ++i) {
    float x = random(-sideLength, sideLength);
    float y = random(-sideLength, sideLength); 
    float z = random(-sideLength, sideLength);
    point(x, y, z);
    strokeWeight(3);
    stroke(0, 150, 255);
  }
  noFill();
  box(sideLength, sideLength, sideLength);
}

