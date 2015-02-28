
int numLines = 100;
float numVertsMin = 10;
float numVertsMax = 100;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(255);
 noFill();
  float numVerts = map(mouseX,0,width,numVertsMin, numVertsMax);
  for (int i = 0; i <numLines;i++) {
    float x = width/numLines*i;
    float y = 0;
    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    for (int j = 1; j<numVerts; j++) {
      float randRange = map(mouseX,0,width,0,100);
      float randOffset = random(randRange);
      x = x+randOffset;
      y += j*height/numVerts;
      curveVertex(x, y);
      x = width/numLines*i;
    }
    curveVertex(x, y);
    endShape();
  }
}
