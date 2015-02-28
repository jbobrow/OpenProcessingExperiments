
void setup() {
  smooth();
  background(random(255), random(255), random(255));
  stroke(255);
}

public int sketchWidth() {
  return displayWidth;
}

public int sketchHeight() {
  return displayHeight;
}

public String sketchRenderer() {
  return P3D;
}

float boxRotation = 0;

void draw() {
  background(255);
  boxRotation += (float) (pmouseX - mouseX)/600;
  boxRotation += (float) (pmouseY - mouseY)/600;
  
  pushMatrix();
    translate(width/2, height/2, 0);
    rotateY(boxRotation);
    rotateX(boxRotation);
    rotateZ(boxRotation);
    stroke(255);
    fill(mouseY * (255.0/1600), 100, mouseX * (255.0/1600));
    box(500);
  popMatrix();
  
}
