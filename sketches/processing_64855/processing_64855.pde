
float numLeaves;
float leafSize;


void setup() {
  size(800,200);
  smooth();
  noStroke();
  noLoop();
  background(237,255,246);
}

void draw(){
for(int x = 50; x<width+80; x +=80) {
  int numLeaves = int(random(5,20));
  int leafSize = int(random(10,30));
//  plant(x, 10, 15);

//float numLeaves = random(5,20);
//float leafSize = random(10,20);

plant(x, numLeaves,leafSize);




}


}


void plant(int x, int numLeaves, int leafSize) {
  stroke(157,80,2);
  strokeWeight(2);
  line(x, 0, x, height);
  int gap = height / numLeaves;
  int direction = 1;
  for (int i = 0; i < numLeaves; i++) {
    int r = int(random(gap));
    leaf(x, gap*i + r,leafSize, direction);
    direction = -direction;
  }

}

  //leaves
void leaf(int x, int y, int size, int dir)  {
  fill(0,198,110);
  pushMatrix();
  noStroke();
  translate(x,y); // move to position
  scale(size);    // scale to size
  beginShape();   // draw the shape
  vertex(1.0*dir,-0.7);
  bezierVertex(1.0*dir, -0.7, 0.4*dir, -1.0, 0.0, 0.0);
  bezierVertex(0.0, 0.0, 1.0*dir, 0.4, 1.0*dir, -0.7);
  endShape();
  popMatrix();
}



