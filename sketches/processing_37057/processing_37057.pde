
void setup() {
  size (450, 450);
}
int shapeNum = 3;     //how many shapes show at once.
int vertexNum = 500;  // numbers of vertex of a curve

void draw() {
  background(random(100,225));
  for (int j=0; j<shapeNum; j++)
    drawShape();
}

void drawShape() {
  beginShape();
  noFill();
  smooth();
  stroke(random(0,100));
  for (int i=0; i<vertexNum; i++) {
    curveVertex(random(-20, 470), random(-20, 470));
  }

  endShape();
}


                
                                
