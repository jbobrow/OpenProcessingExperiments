
void setup() {
  size(500, 500, P3D);
  background(255);
}

void draw() {
  lights();
  float sideLength = width*0.2;
  translate(width/2, height/2);
  rotateY((mouseX+width/2)*0.01);
  rotateX((mouseY+height/2)*0.01);
  float x = random(-sideLength, sideLength);
  float y = random(-sideLength, sideLength);
  float z = random(-sideLength, sideLength);
  fill(255);
  box(250);
  strokeWeight(3);
  stroke(0, 150, 255);
  //filter(ERODE);
}

