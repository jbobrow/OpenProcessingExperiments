
float boxSize = 2;
float margin = 100;

void setup() {
  size(500, 500, P3D);
  frameRate(12);
  noStroke();
}

void clearBackground() {
  background(0);
}
void draw() {
  clearBackground();
  lights();
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.01);
  rotateX(frameCount * 0.01);

  for (float i =- height+margin; i <= height-margin; i += margin){
    pushMatrix();
    for (float j =- height+margin; j <= height-margin; j += margin){
      pushMatrix();
      for (float k =- width+margin; k <= width-margin; k += margin){
        pushMatrix();
        translate(k, j, i);
        fill(random(255),random(255),random(255));
        box(boxSize, boxSize, boxSize);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
}
