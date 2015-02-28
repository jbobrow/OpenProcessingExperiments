
/**
Simple geometric flowers
Moving the mouse changes width and length of the petals, click to rotate
Press 'n' to increase the number of petals, 'N' to decrease
*/

int numberOfPetals = 4;
float basePetalWidth = 75,
  basePetalLength = 50,
  rotationAngle = 0,
  sizeMultiplier = 6;

void setup(){
  size(500, 500);
  background(255);
  stroke(0);
  strokeWeight(1);
  
  fill(170, 150, 255, 30);
}

void draw() {
  background(255);
  
  if (mousePressed) {
    rotationAngle += 0.02;
  }
  
  float petalWidth = map(mouseX, 0, width, basePetalWidth / sizeMultiplier, basePetalWidth * sizeMultiplier);
  float petalLength = map(mouseY, 0, height, basePetalLength / sizeMultiplier, basePetalLength * sizeMultiplier);
  
  float angle = 360 / numberOfPetals;
  
  pushMatrix();
  
  translate(width/2, height/2);
  rotate(rotationAngle);
  
  for(int i = 0; i < numberOfPetals; i++) {
    petal(petalWidth, petalLength);
    rotate(radians(angle));
  }
  
  popMatrix();
}

void petal(float w, float h) {
  // the control points (c1, c2) are set a quarter of the way between each vertex
  // to give the petal a nice curve
  PVector c1 = new PVector(w/4, h/4);
  PVector c2 = new PVector(w/4, h - h/4);
  beginShape();
  vertex(0,0);
  bezierVertex(c1.x, c1.y, c2.x, c2.y, 0, h);
  bezierVertex(-c2.x, c2.y, -c1.x, c1.y, 0, 0);
  endShape();
}

void keyPressed() {
  if (key == 'n') numberOfPetals++;
  if (key == 'N') numberOfPetals = max(numberOfPetals - 1, 1);
}


